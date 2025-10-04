//
//  OrdersViewModel.swift
//  ShoeShop
//
//  Created by Zhen Wai on 02/03/2024.
//

import Foundation
import FirebaseAuth
import Firebase

class ordersViewModel:ObservableObject{
    @Published var orderItems:[orderItem] = []
    
    func addNewOrder(cartItems:[cartItem],completion: @escaping(Bool) -> Void){
        guard let userID = Auth.auth().currentUser?.uid else{
           completion(false)
            return
        }
        
        let cartItemsData = cartItems.map{orders -> [String:Any] in
            return [
                "shoeID":orders.shoe.id,
                "selectedSize":orders.selectedSize,
                "quantity":orders.quantity
            ]
        }
        
        //update firestore
        let db = Firestore.firestore()
        let newOrder = db.collection("userOrders").document(userID).collection("orders").document()
        newOrder.setData([
            "id":newOrder.documentID,
            "cartItems":cartItemsData,
        ]){error in
            if let error = error{
                print("\(error)")
                completion(false)
            }else{
                print("Successfully saved!")
                completion(true)
            }
        }
    }
    
    func fetchOrdersFromFirebase(){
        guard let userID = Auth.auth().currentUser?.uid else{return}
        
        let db = Firestore.firestore()
        db.collection("userOrders").document(userID).collection("orders").getDocuments { [weak self](querySnapshot, error) in
            if let error = error{
                print("\(error)")
            }
            
            var fetchedItems = [orderItem]()
            
            for document in querySnapshot!.documents{
                let data = document.data()
                
                if let cartItemsData = data["cartItems"] as? [[String:Any]]{
                    
                    for item in cartItemsData{
                        guard let shoeID = item["shoeID"] as? String,
                              let selectedSize = item["selectedSize"] as? String,
                              let quantity = item["quantity"] as? Int,
                              let shoe = Shoes.first(where: {$0.id == shoeID}) else{
                            continue
                        }
                        
                        // subtotal for each item
                        let subtotal = Double(quantity) * shoe.price
                        
                        let cartItem = cartItem(shoe: shoe, selectedSize: selectedSize, quantity: quantity)
                        let order = orderItem(cartItem: cartItem, subtotal: subtotal)
                        fetchedItems.append(order)
                    }
                }
                DispatchQueue.main.async {
                    self?.orderItems = fetchedItems
                }
            }
        }
    }
}
