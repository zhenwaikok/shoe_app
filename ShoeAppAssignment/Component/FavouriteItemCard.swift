//
//  FavouriteItemCard.swift
//  ShoeShop
//
//  Created by Zhen Wai on 29/02/2024.
//

import SwiftUI

struct FavouriteItemCard: View {
    
    @EnvironmentObject var favouriteVM:favouriteViewModel
    
    var favouriteItem:favouriteItem
    
    var body: some View {
        HStack{
            
            Image(favouriteItem.shoe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
            
            VStack(alignment: .leading){
                Text(favouriteItem.shoe.title)
                    .font(.caption.bold())
                    .padding(.bottom)
                
                Text(String(format: "RM %.2f", favouriteItem.shoe.price))
                    .font(.caption.bold())
            }
            .padding()
            
            Spacer()
            
            Button(action: {favouriteVM.removeFromFavourite(shoe: favouriteItem.shoe)}, label: {
                Image(systemName: "multiply")
                    .foregroundStyle(.black)
            })
            
            
            
        }
        .padding()
    }
}

#Preview {
    FavouriteItemCard(favouriteItem: favouriteItem(shoe: Shoes[0]))
        .environmentObject(favouriteViewModel())
}
