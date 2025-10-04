//
//  OrdersItem.swift
//  ShoeShop
//
//  Created by Jei Jason on 04/03/2024.
//

import Foundation

struct orderItem:Identifiable{
    let id = UUID()
    var cartItem:cartItem
    var subtotal:Double
}
