//
//  CartItemCard.swift
//  ShoeShop
//
//  Created by Zhen Wai on 27/02/2024.
//

import SwiftUI

struct CartItemCard: View {
    
    @EnvironmentObject var cartVM : CartViewModel
    
    var CartItem:cartItem

    
    var body: some View {
        HStack{
            Image(CartItem.shoe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
            
            VStack(alignment: .leading){
                Text(CartItem.shoe.title)
                    .font(.caption.bold())
                
                Text("Size \(CartItem.selectedSize)")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                HStack{
                    Button(action: {
                        let newQuantity = max(1, self.CartItem.quantity - 1)
                        cartVM.updateQuantity(for: CartItem.shoe.id, newQuantity: newQuantity, selectedSize: CartItem.selectedSize)
                    }, label: {
                        Image(systemName: "minus")
                            .foregroundStyle(.black)
                            .font(.caption)
                    })
                    .padding(.horizontal,10)
                    .padding(.vertical, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
                    )
                    
                    Text("\(CartItem.quantity)")
                        .padding(6)
                    
                    Button(action: {
                        let newQuantity = self.CartItem.quantity + 1
                        cartVM.updateQuantity(for: CartItem.shoe.id, newQuantity: newQuantity, selectedSize: CartItem.selectedSize)
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color("mainColour"))
                            .font(.caption)
                    })
                    .padding(.horizontal,10)
                    .padding(.vertical, 11)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
                    )
                }
                
            }
            
            Spacer()
            
            VStack{
                
                HStack {
                    Spacer()
                    Button(action: {cartVM.removeFromCart(shoeID: CartItem.shoe.id, selectedSize: CartItem.selectedSize)}, label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.red)
                    })
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(String(format: "RM %.2f", CartItem.shoe.price))
                        .font(.caption.bold())
                }
            }
            .frame(height:70)
            
        }
        .padding()
    }
}

#Preview {
    CartItemCard(CartItem: cartItem(shoe: Shoes[0], selectedSize: "UK7", quantity: 2))
        .environmentObject(CartViewModel())
}
