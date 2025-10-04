//
//  LogIn.swift
//  ShoeShop
//
//  Created by Zhen Wai on 22/02/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct LogIn: View {
    
    @EnvironmentObject var cartVM: CartViewModel
    @EnvironmentObject var favouriteVM: favouriteViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email:String = ""
    @State private var pwd:String = ""
    @State private var isPwdVisible:Bool = false
    @State private var isAuthenticated:Bool = false
    
    //alert message variable
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                
                HStack{
                    Button(action:{dismiss()}){
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                    Spacer()
                }
                .padding()
                
                Image("logo")
                    .resizable()
                    .frame(width:90, height:90)
                    .rotationEffect(.degrees(45))
                
                Text("Log In")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 15)
                    
                Text("Enter your username and password")
                    .fontWeight(.thin)
                    .padding(.bottom, 90)
                
                HStack{
                    Text("Email Address")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                TextField("", text:$email)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                    .padding(.bottom, 8)
                    .overlay(
                        Rectangle()
                            .frame(height:1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.bottom, 8)
         
                HStack{
                    Text("Password")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                HStack{
                    if isPwdVisible{
                        TextField("", text:$pwd)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 4)
                            .padding(.bottom, 8)
                    }else{
                        SecureField("", text:$pwd)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 4)
                            .padding(.bottom, 8)
                    }
                    
                    Button(action: {isPwdVisible.toggle()} , label: {
                        Image(systemName: isPwdVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    })
                    .padding(.trailing, 8)
                }
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .foregroundColor(.gray),
                    alignment: .bottom
                )
                .padding()
                
                Spacer()
                
                Button(action: {logIn()}, label: {
                    Text("Log In")
                        .fontWeight(.semibold)
                })
                .frame(height:60)
                .frame(maxWidth: .infinity)
                .background(Color("mainColour"))
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.horizontal)
                
                NavigationLink(destination: ContentView()
                    .environmentObject(favouriteVM).environmentObject(cartVM), isActive: $isAuthenticated){
                    EmptyView()
                }
                
                NavigationLink{
                    SignUp()
                        .environmentObject(favouriteVM).environmentObject(cartVM)
                }label:{
                    HStack{
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        
                        Text("Sign Up")
                            .foregroundColor(Color("mainColour"))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .fontWeight(.thin)
                }
            }
            .padding()
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: pwd) { (result, error) in
            if let _ = error {
                self.alertMessage = "Login failed. Check your email address or password and try again."
                self.showAlert = true
            } else {
                self.alertMessage = "Log in successfully!"
                self.showAlert = true
                self.isAuthenticated = true
                DispatchQueue.main.async {
                    self.cartVM.fetchCartItemsFromFirebase(){ success in
                        if success {
                            print("Successfully fetched and updated cart items.")
                        } else {
                            print("Failed to fetch cart items.")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LogIn()
        .environmentObject(CartViewModel())
        .environmentObject(favouriteViewModel())
}
