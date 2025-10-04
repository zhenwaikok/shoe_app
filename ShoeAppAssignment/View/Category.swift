//
//  Category.swift
//  ShoeShop
//
//  Created by Zhen Wai on 24/02/2024.
//

import SwiftUI

struct Category: View {
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                Text("Shoe Category")
                    .font(.title.bold())
                    .padding()
                VStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:30)], spacing:15){
                            ForEach(categories){ category in
                                NavigationLink(destination: ShoeListView(shoes: shoesForCategory( categoryName: category.title), categoryName: category.title)){
                                    CategoryCard(category: category)
                                }
                        }
                    }
                }
                .padding(.horizontal,20)
                .padding(.top)
            }
        }
    }
    
    func shoesForCategory(categoryName: String) -> [Shoe] {
        Shoes.filter { $0.category == categoryName }
    }
}

#Preview {
    Category()
}
