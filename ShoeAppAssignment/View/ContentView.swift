//
//  ContentView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cartManager:CartViewModel
    @EnvironmentObject var favouriteVM:favouriteViewModel
    
    var body: some View {
        NavigationStack {
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
                Category()
                    .tabItem {
                        Image(systemName: "square.fill.text.grid.1x2")
                        Text("Categories")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
                CartView()
                    .environmentObject(cartManager)
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
                FavouriteView()
                    .environmentObject(favouriteVM)
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
                ProfileView()
                    .environmentObject(profileViewModel())
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
                
            }
            .accentColor(Color("mainColour"))
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
        .environmentObject(CartViewModel())
        .environmentObject(favouriteViewModel())
}
