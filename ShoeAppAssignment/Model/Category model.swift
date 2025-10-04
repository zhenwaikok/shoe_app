//
//  Category model.swift
//  ShoeShop
//
//  Created by Jei Jason on 04/03/2024.
//

import Foundation

struct category: Identifiable{
    var id = UUID()
    var title:String
    var image:String
}

var categories:[category] = [
    .init(title: "Running Shoe", image: "runningShoe"),
    .init(title: "Basketball Shoe", image: "basketballShoe"),
    .init(title: "Sandals", image: "sandals"),
    .init(title: "Badminton Shoe", image: "badmintonShoe"),
    .init(title: "Sneakers", image: "sneaker"),
    .init(title: "Hiking Shoe", image: "hikingShoe")
]
