//
//  CartItem.swift
//  ShoeShop
//
//  Created by Jei Jason on 04/03/2024.
//

import Foundation

struct cartItem:Identifiable{
    let id = UUID()
    var shoe:Shoe
    var selectedSize:String
    var quantity:Int
}
