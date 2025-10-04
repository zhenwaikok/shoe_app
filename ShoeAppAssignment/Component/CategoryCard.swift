//
//  CategoryCard.swift
//  ShoeShop
//
//  Created by Zhen Wai on 24/02/2024.
//

import SwiftUI

struct CategoryCard: View {
    
    var category : category
    
    var body: some View {
        VStack{
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth:180)
                .frame(height:170)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom){
                    Text(category.title)
                        .foregroundColor(.white)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .padding()
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3,x:0,y:0)
                }
        }
        .padding()    }
}

#Preview {
    CategoryCard(category: categories[0])
}
