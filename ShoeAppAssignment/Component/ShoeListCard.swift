//
//  ShoeListCard.swift
//  ShoeShop
//
//  Created by Zhen Wai on 04/03/2024.
//

import SwiftUI

struct ShoeListCard: View {
    
    var shoe:Shoe
    
    var body: some View {
        VStack{
            Image(shoe.image)
                .resizable()
                .scaledToFit()
                .frame(width:150,height:150)
            
            Text(shoe.title)
                .font(.callout.bold())
                .padding()
            
            Text(String(format: "RM %.2f", shoe.price))
                .font(.callout.bold())
        }
        .padding()
        .clipped()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray,lineWidth:1)
        )
    }
}

#Preview {
    ShoeListCard(shoe: Shoes[0])
}
