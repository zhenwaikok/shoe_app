//
//  Onboard.swift
//  ShoeShop
//
//  Created by Zhen Wai on 22/02/2024.
//

import SwiftUI

struct Onboard: View {
    
    @State private var navigateToNextScreen = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("OnBoardImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    Spacer()
                    
                    Image("onboardlogo")
                        .resizable()
                        .frame(width:90, height:90)
                        .rotationEffect(.degrees(45))
                    
                    
                    Text("Welcome To \nOur Shoes Shop")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.top, 70)

                    Text("Grab your shoes here")
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .padding(.bottom, 80)
                    
                    NavigationLink(destination: ContentView(), isActive:$navigateToNextScreen){
                        EmptyView()
                    }
                    
                    Button(action: {
                        self.navigateToNextScreen = true
                    }, label: {
                        Text("Get Started")
                            .fontWeight(.semibold)
                    })
                    .frame(height:60)
                    .frame(maxWidth:.infinity)
                    .background(Color("mainColour"))
                    .foregroundColor(.white)
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Onboard()
        .environmentObject(CartViewModel())
        .environmentObject(favouriteViewModel())
}
