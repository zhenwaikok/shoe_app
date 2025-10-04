//
//  ShoeListView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 26/02/2024.
//

import SwiftUI

struct ShoeListView: View {
    
    @Environment(\.dismiss) var dismiss
    var shoes : [Shoe] = Shoes
    var categoryName:String
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                        })
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text(categoryName)
                        .font(.title.bold())
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:30)], spacing:25){
                        ForEach(shoes){ shoe in
                            NavigationLink(destination: DescriptionView(shoe: shoe)
                            ){
                                ShoeListCard(shoe: shoe)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .padding()
                }
            }
            .scrollIndicators(.hidden)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ShoeListView(categoryName: "Running Shoe")
}
