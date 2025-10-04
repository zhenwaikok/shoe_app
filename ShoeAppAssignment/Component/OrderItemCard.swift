//
//  CompletedOrderView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 02/03/2024.
//

import SwiftUI

struct OrderItemCard: View {
    @EnvironmentObject var ordersVM:ordersViewModel
    
    var ordersItem:orderItem
    
    var body: some View {
        HStack{
            Image(ordersItem.cartItem.shoe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:105)
            
            VStack(alignment: .leading){
                Text(ordersItem.cartItem.shoe.title)
                    .font(.caption.bold())
                
                Text("Size \(ordersItem.cartItem.selectedSize), Qty: \(ordersItem.cartItem.quantity)")
                    .foregroundStyle(.gray)
                    .font(.caption)
                    .padding(.bottom, 12)
                
                Text(String(format: "RM %.2f", ordersItem.cartItem.shoe.price))
                    .font(.caption.bold())
            }
            .frame(width:130)
            
            Spacer()
            
            VStack{
                HStack
                {
                    Spacer()
                     
                    Text("Paid")
                        .foregroundStyle(.green)
                        .font(.caption.bold())
                        .padding()
                }
                
                Text(String(format: "Total: RM %.2f", ordersItem.subtotal))
                    .font(.caption.bold())
                
            }
            
        }
        .padding()
    }
}

#Preview {
    OrderItemCard(ordersItem: orderItem(cartItem: cartItem(shoe: Shoes[2], selectedSize: "UK6", quantity: 2), subtotal: 300))
        .environmentObject(ordersViewModel())
}
