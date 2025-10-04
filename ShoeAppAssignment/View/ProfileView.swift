//
//  ProfileView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 01/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profileVM = profileViewModel()
    @State var toLogin:Bool = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Image(systemName: "person.fill")
                .resizable()
                .frame(width:80,height: 80)
            
            Text(profileVM.userName)
                .font(.title.bold())
            
            Spacer()
            
            NavigationLink(destination: OrdersView().environmentObject(ordersViewModel())){
                HStack{
                    Image(systemName: "bag")
                        .resizable()
                        .frame(width:50, height:50)
                    
                    Text("Orders")
                        .font(.title2.bold())
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .font(.title2.bold())
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray,lineWidth: 2))
            }
            .foregroundStyle(.black)
            
            Spacer()
            
            
            if profileVM.isLoggedIn{
                Button(action: {profileVM.logOut()}, label: {
                    Text("Log Out")
                        .padding()
                        .padding(.horizontal, 115)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .background(Color("mainColour"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
            }else
            {
                Button(action: {toLogin = true}, label: {
                    Text("Log In")
                        .padding()
                        .padding(.horizontal, 115)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .background(Color("mainColour"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                
                NavigationLink(destination: LogIn(), isActive: $toLogin){
                    EmptyView()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
