//
//  PaymentView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 01/03/2024.
//

import SwiftUI

struct PaymentView: View {
    
    @EnvironmentObject var ordersVM:ordersViewModel
    @EnvironmentObject var cartVM:CartViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cardNum:String = ""
    @State private var Name:String = ""
    @State private var expiryDate:String = ""
    @State private var CVV:String = ""
    @State private var alertMessage:String = ""
    @State private var isAlert:Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    })
                    
                    Spacer()
                }
                .padding()
                
                Text("Checkout")
                    .font(.title2.bold())
                    .padding()
                Spacer()
                
                VStack(spacing:35){
                    TextField("Card Number", text: $cardNum)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                    TextField("Name", text: $Name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                    TextField("Expiry Date DD/MM/YY", text: $expiryDate)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                    TextField("CVV", text: $CVV)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                }
                .padding()
                
                Spacer()
                Button(action: {
                    addOrder()
                }, label: {
                    Text("Pay")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal, 100)
                        .background(Color("mainColour"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                
                
                Spacer()
            }
            .alert(isPresented: $isAlert) {
                Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")){
                    if cartVM.purchasedSuccessful{
                        self.dismiss()
                    }
                }
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    func addOrder(){
        //check if any field is empty
        if cardNum.isEmpty || Name.isEmpty || expiryDate.isEmpty || CVV.isEmpty{
            
            //alert message
            alertMessage = "Please fill in all fields."
            isAlert = true
        }else{
            ordersVM.addNewOrder(cartItems: cartVM.cartItems){success in
                if success{
                    cartVM.clearCart()
                    alertMessage = "You have purchased successful."
                    DispatchQueue.main.async {
                        // Update purchase success state
                        self.cartVM.purchasedSuccessful = true
                    }
                }else{
                    //error message
                    alertMessage = "Kindly log in to purchase."
                }
                isAlert = true
                
            }
        }
    }
}

#Preview {
    PaymentView()
        .environmentObject(ordersViewModel())
        .environmentObject(CartViewModel())
}
