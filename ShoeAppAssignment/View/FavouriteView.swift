//
//  FavouriteView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 29/02/2024.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var favouriteVM:favouriteViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators:false){
            VStack{
                Text("My Favourite")
                    .font(.title2.bold())
                
                if favouriteVM.favouriteItems.count > 0{
                    ForEach (favouriteVM.favouriteItems, id: \.id){items in
                        NavigationLink(destination: DescriptionView(shoe: items.shoe)){
                            FavouriteItemCard(favouriteItem: items)
                                .environmentObject(favouriteVM)
                        }
                        .foregroundStyle(.black)
                    }
                }else{
                    Text("Your favourite list is empty.")
                        .padding()
                }
            }
        }
        .onAppear(){
            favouriteVM.fetchFavouriteItemsFromFirebase()
        }
    }
}

#Preview {
    FavouriteView()
        .environmentObject(favouriteViewModel())
}
