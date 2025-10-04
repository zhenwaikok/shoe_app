//
//  CartView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 27/02/2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var CartVM:CartViewModel
    
    @State var showPaymentView:Bool = false
    
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
                Text("My Cart")
                    .font(.title2.bold())
                
                if CartVM.purchasedSuccessful {
                    Text("Thank you for your purchase!")
                        .padding()
                }else{
                    if CartVM.cartItems.count > 0{
                        ForEach(CartVM.cartItems, id: \.id){items in
                            NavigationLink(destination: DescriptionView(shoe:items.shoe)){
                                CartItemCard(CartItem: items)
                                    .environmentObject(CartVM)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Spacer()
                        
                        HStack{
                            Spacer()
                            
                            Text(String(format:"Total: RM %.2f", CartVM.total))
                                .font(.title2.bold())
                        }
                        .padding()
                        
                        NavigationLink(destination: PaymentView().environmentObject(CartVM).environmentObject(ordersViewModel())){
                            Text("Checkout")
                                .font(.title2.bold())
                                .foregroundStyle(.white)
                                .padding()
                                .padding(.horizontal,115)
                                .background(Color("mainColour"))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                    }else{
                        Text("Your cart is empty.")
                            .padding()
                    }
                }
                
                
                Spacer()
                
            }
        }
        .onDisappear(){
            if CartVM.purchasedSuccessful{
                CartVM.purchasedSuccessful = false
            }
        }
    }
    
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
