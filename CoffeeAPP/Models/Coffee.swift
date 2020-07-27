//
//  Coffee.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/25.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee{
    static func all() -> [Coffee] {
        return [
            Coffee(name: "浓缩咖啡", imageURL: "c01" , price: 2.5),
            Coffee(name: "马琪雅朵", imageURL: "c02", price: 2.1),
            Coffee(name: "美式咖啡", imageURL: "c03", price: 1.5),
        ]
    }
}
