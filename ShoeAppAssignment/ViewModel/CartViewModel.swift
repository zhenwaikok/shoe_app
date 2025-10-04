//
//  CartViewModel.swift
//  ShoeShop
//
//  Created by Zhen Wai on 26/02/2024.
//

import Foundation
import FirebaseAuth
import Firebase

class CartViewModel: ObservableObject{
    @Published var cartItems:[cartItem] = []
    @Published var total:Double = 0
    @Published var purchasedSuccessful:Bool = false
    
    init() {
        self.setupAuthListener()
    }
    
    //add shoe to cart or update existing shoe quantity
    func addToCart(shoe:Shoe, quantity:Int, selectedSize:String){
        if let index = cartItems.firstIndex(where: {
            $0.shoe.id == shoe.id && $0.selectedSize == selectedSize
        }){
            cartItems[index].quantity += quantity
        }else{
            let newItem = cartItem(shoe: shoe, selectedSize: selectedSize, quantity: quantity)
            cartItems.append(newItem)
        }
        
        updateTotal()
        
        synchronizeCartWithFirestore()
    }
    
    
    func removeFromCart(shoeID:String, selectedSize:String){
        cartItems.removeAll{
            $0.shoe.id == shoeID && $0.selectedSize == selectedSize
        }
        updateTotal()
        synchronizeCartWithFirestore()
    }
    
    func setupAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let user = user {
                print("Logged in as \(user.uid)")
                self?.fetchCartItemsFromFirebase(){ success in
                    if success {
                        print("Successfully fetched and updated cart items.")
                    } else {
                        print("Failed to fetch cart items.")
                    }
                }
            } else {
                print("Not logged in")
                self?.cartItems = [] // Clear cart items if not logged in
                self?.updateTotal()
            }
        }
    }
    
    func synchronizeCartWithFirestore(){
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //prepare data for firestore
        let cartData = cartItems.map{ item -> [String: Any] in
            ["shoeID": item.shoe.id,
             "selectedSize": item.selectedSize,
             "quantity": item.quantity]
        }
        
        //update firestore
        let db = Firestore.firestore()
        db.collection("userCarts").document(userID).setData(["cartItems":cartData], merge: true){ error in
            if let error = error{
                print("Error updating cart: \(error)")
            }else{
                print("Cart successfully synchronized with firestore")
            }
        }
    }
    
    func clearCart(){
        guard let userID = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        db.collection("userCarts").document(userID).setData(["cartItems":[]]){error in
            if let error = error{
                print("Error to clear cart: \(error)")
            }else{
                DispatchQueue.main.async {
                    self.cartItems = []
                    self.updateTotal()
                }
            }
        }
    }
    
    func fetchCartItemsFromFirebase(completion: @escaping (Bool) -> Void) {
        guard let userID = Auth.auth().currentUser?.uid else {
            completion(false) // User is not logged in, so we can't fetch the cart.
            return
        }

        let db = Firestore.firestore()
        db.collection("userCarts").document(userID).getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(), let cartItemsData = data["cartItems"] as? [[String: Any]] {
                    DispatchQueue.main.async {
                        
                        self.cartItems = cartItemsData.compactMap { dict -> cartItem? in
                            guard let shoeID = dict["shoeID"] as? String,
                                  let selectedSize = dict["selectedSize"] as? String,
                                  let quantity = dict["quantity"] as? Int else {
                                print("mapping isse")
                                return nil
                            }
                            
                            guard let shoe = Shoes.first(where: { $0.id == shoeID }) else{
                                print("Failed to find a shoe matching the shoeID: \(shoeID)")
                                    // Additional logging to help identify the issue:
                                    print("Available shoe IDs: \(Shoes.map { $0.id })")
                                return nil
                            }
                            return cartItem(shoe: shoe, selectedSize: selectedSize, quantity: quantity)
                        }
                        self.updateTotal()
                        print("Fetched cart items: \(self.cartItems)")
                        completion(true) // Successfully fetched and mapped cart items
                    }
                } else {
                    print("Document does not contain expected data.")
                    completion(false)
                }
            } else if let error = error {
                print("Error fetching document: \(error)")
                completion(false)
            } else {
                print("Document does not exist.")
                completion(false)
            }
        }
    }

    
    func updateQuantity(for shoeID:String, newQuantity:Int, selectedSize:String){
        if let index = cartItems.firstIndex(where: {
            $0.shoe.id == shoeID && $0.selectedSize == selectedSize
        }){
            cartItems[index].quantity = newQuantity
            updateTotal()
            synchronizeCartWithFirestore()
        }
    }
    
    private func updateTotal(){
        total = cartItems.reduce(0){
            $0 + ($1.shoe.price * Double($1.quantity))
        }
        
    }
    
}
