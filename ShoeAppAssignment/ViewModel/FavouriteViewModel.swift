//
//  FavouriteViewModel.swift
//  ShoeShop
//
//  Created by Zhen Wai on 29/02/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class favouriteViewModel:ObservableObject{
    @Published var favouriteItems:[favouriteItem] = []
    
    init(){
        setupAuthListener()
    }
    
    func addToFavourite(shoe:Shoe){
        if !favouriteItems.contains(where: {$0.shoe.id == shoe.id}){
            let newItem = favouriteItem(shoe: shoe)
            favouriteItems.append(newItem)
            synchronizeFavouriteWithFirestore()
        }
    }
    
    func isFavourite(shoe:Shoe) -> Bool{
        return favouriteItems.contains(where: {$0.shoe.id == shoe.id})
    }
    
    func removeFromFavourite(shoe:Shoe){
        favouriteItems.removeAll{ $0.shoe.id == shoe.id}
        synchronizeFavouriteWithFirestore()
    }
    
    func setupAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let user = user {
                print("Logged in as \(user.uid)")
                self?.fetchFavouriteItemsFromFirebase()
            } else {
                print("Not logged in")
                self?.favouriteItems = [] // Clear favourite items if not logged in
            }
        }
    }
    
    func synchronizeFavouriteWithFirestore(){
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //prepare data for firestore
        let favouriteData = favouriteItems.map{ item -> [String: Any] in
            ["shoeID": item.shoe.id]
        }
        
        //update firestore
        let db = Firestore.firestore()
        db.collection("userFavourites").document(userID).setData(["favouriteItems":favouriteData], merge: true){ error in
            if let error = error{
                print("Error updating cart: \(error)")
            }else{
                print("Favourite successfully synchronized with firestore")
            }
        }
    }
    
    func fetchFavouriteItemsFromFirebase(){
        guard let userID = Auth.auth().currentUser?.uid else{
            print("No user ID found")
            return
        }
        
        print(userID)
        let db = Firestore.firestore()
        db.collection("userFavourites").document(userID).getDocument{ (document, error) in
            if let document = document, document.exists{
                if let data = document.data(), let favouriteItemsData = data["favouriteItems"] as? [[String:Any]]{
                    self.favouriteItems = favouriteItemsData.compactMap{dict -> favouriteItem? in
                        guard let shoeID = dict["shoeID"] as? String,
                              let shoe = Shoes.first(where:{$0.id == shoeID})else{
                            return nil
                        }
                        return favouriteItem(shoe: shoe)
                    }
                    print("fetched favourite items: \(self.favouriteItems)")
                }else{
                    print("Document does not exist.")
                }
            }
        }
    }
    
}
