//
//  ProfileViewModel.swift
//  ShoeShop
//
//  Created by Zhen Wai on 02/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestore

class profileViewModel: ObservableObject{
    @Published var userName:String = ""
    @Published var isLoggedIn:Bool = false
    
    init(){
        self.isLoggedIn = Auth.auth().currentUser != nil
        fetchUserName()
    }
    
    func fetchUserName(){
        guard let userID = Auth.auth().currentUser?.uid else{return}
        print(userID)
        
        let db = Firestore.firestore()
        db.collection("Users").document(userID).getDocument { (document, error) in
            if let document = document, document.exists{
                let data = document.data()
                self.userName = data?["User Name"] as? String ?? "No Name"
            }else{
                print("Document does not exist")
            }
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.userName = ""
        }catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
    }
}
