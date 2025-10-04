//
//  Home.swift
//  ShoeShop
//
//  Created by Zhen Wai on 24/02/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 60, height:60)
                    .rotationEffect(.degrees(45))
                HStack{
                    Text("Find your shoe here!")
                        .font(.title2.bold())
                    
                    Spacer()
                }
                .padding(.horizontal,20)
                
                HStack{
                    Text("Happy Shooping!")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.horizontal,20)
                
                HStack{
                    Text("Popular")
                        .font(.title2.bold())
                    
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal,20)
                
                
                ScrollView(.horizontal){
                    popularView
                }
                .scrollIndicators(.hidden)
                
                HStack{
                    Text("Best Selling")
                        .font(.title2.bold())
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal,20)
                
                ScrollView(.horizontal){
                    bestSellingView
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
    }
    
    //popular shoe
    var popularView: some View{
        HStack{
            ForEach(Shoes.filter{ $0.best_Popular == "popular"}, id: \.id ){ shoe in
                NavigationLink(destination: DescriptionView(shoe:shoe)){
                    VStack{
                        Image(shoe.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150,height:150)
                        HStack{
                            Text(shoe.title)
                                .font(.callout.bold())
                            
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .padding(.bottom, 20)
                        
                        HStack{
                            Text(String(format: "RM %.2f", shoe.price))
                                .font(.callout.bold())
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal,10)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray,lineWidth:1)
                    )
                }
                .foregroundStyle(.black)
            }
            .padding(.horizontal,10)
            .ignoresSafeArea()
        }
    }
    
    //best selling shoe
    var bestSellingView: some View{
        HStack{
            ForEach(Shoes.filter{ $0.best_Popular == "best selling"}, id: \.id ){ shoe in
                NavigationLink(destination: DescriptionView(shoe:shoe)){
                    VStack{
                        Image(shoe.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150,height:150)
                        HStack{
                            Text(shoe.title)
                                .font(.callout.bold())
                            
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .padding(.bottom, 20)
                        
                        HStack{
                            Text(String(format: "RM %.2f", shoe.price))
                                .font(.callout.bold())
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal,10)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray,lineWidth:1)
                    )
                }
                .foregroundStyle(.black)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    Home()
}
