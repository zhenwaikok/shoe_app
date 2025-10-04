//
//  OrdersView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 02/03/2024.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject var ordersVM:ordersViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators:false) {
            VStack{
                HStack{
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    })
                    Spacer()
                }
                .padding()
                
                Text("Purchased Orders")
                    .font(.title2.bold())
                
                if ordersVM.orderItems.count > 0{
                    ForEach(ordersVM.orderItems, id: \.id){items in
                        OrderItemCard(ordersItem: items)
                            .environmentObject(ordersVM)
                        
                    }
                }else{
                    Text("You have no purchased orders.")
                        .padding()
                }
                
                
            }
            .onAppear(){
                ordersVM.fetchOrdersFromFirebase()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    OrdersView()
        .environmentObject(ordersViewModel())
}
