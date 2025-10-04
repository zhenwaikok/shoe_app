//
//  SignUp.swift
//  ShoeShop
//
//  Created by Zhen Wai on 04/03/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


struct SignUp: View {
    
    @State private var isPwdVisible:Bool = false
    @State private var isPasswordValid: Bool = true
    @State private var toLogin = false
    
    @State private var username:String = ""
    @State private var email:String = ""
    @State private var pwd:String = ""
    @State private var contactNo:String = ""
    @State private var address:String = ""
    
    //Alert state variables
    @State private var showAlert:Bool = false
    @State private var alertMessage:String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width:90, height:90)
                        .rotationEffect(.degrees(45))
                    
                    
                    Text("Sign Up")
                        .font(.largeTitle.bold())
                        .padding(.bottom, 15)
                    
                    Text("Enter your details below to sign up")
                        .fontWeight(.thin)
                        .padding(.bottom, 50)
                    
                    HStack{
                        Text("Username")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    TextField("", text:$username)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                        .overlay(
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                        .padding()
                    
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
                                .onChange(of: pwd){ _ in
                                    isPasswordValid = pwd.count>=6
                                }
                        }else{
                            SecureField("", text:$pwd)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 4)
                                .padding(.bottom, 8)
                                .onChange(of: pwd){ _ in
                                    isPasswordValid = pwd.count>=6
                                }
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
                    
                    //show real time message if password < 6
                    HStack{
                        if !isPasswordValid {
                            Text("Password must be at least 6 characters")
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal,16)
                    .padding(.bottom,5)
                    
                    HStack{
                        Text("Contact No")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    TextField("", text:$contactNo)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                        .overlay(
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                        .padding()
                    
                    HStack{
                        Text("Email")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    TextField("", text:$email)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                        .overlay(
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                        .padding()
                    
                    HStack{
                        Text("Address")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    TextField("", text:$address)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                        .overlay(
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                        .padding()
                    
                    Button(action: {signUp()}, label: {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    })
                    .frame(height:60)
                    .frame(maxWidth: .infinity)
                    .background(Color("mainColour"))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    
                    
                    NavigationLink{
                        LogIn()
                    }label:{
                        HStack{
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                            
                            Text("Log In")
                                .foregroundColor(Color("mainColour"))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .fontWeight(.thin)
                    }
                }
                .padding()
                .autocapitalization(.none)
            }
            .padding(.top,1)
            .padding(.bottom,0.5)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
            
            NavigationLink(destination: LogIn(), isActive: $toLogin){
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func signUp(){
        // Check for blank field
        if username.isEmpty || pwd.isEmpty || contactNo.isEmpty || email.isEmpty || address.isEmpty {
            alertMessage = "Please fill in all fields"
            showAlert = true
            return
        }
        
        // Sign up
        Auth.auth().createUser(withEmail: email, password: pwd) { [self] (result, error) in
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
            } else if let result = result {
                let db = Firestore.firestore()
                let userData: [String: Any] = [
                    "User Name": username,
                    "Contact No": contactNo,
                    "Email": email,
                    "Address": address,
                ]
                
                // Use the uid from the auth result
                let uid = result.user.uid
                db.collection("Users").document(uid).setData(userData) { err in
                    if let err = err {
                        alertMessage = err.localizedDescription
                        showAlert = true
                    } else {
                        // Display successful sign up message
                        alertMessage = "Successfully signed up, \(username)!"
                        showAlert = true
                        toLogin = true
                    }
                }
            }
        }
    }

    
}

#Preview {
    SignUp()
}
