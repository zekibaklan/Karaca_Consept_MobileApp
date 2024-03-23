//
//  OrderModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import Foundation

class Order: Identifiable, Hashable, Equatable {
    
    static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let products: [Product]
    let total: Int
    let date: Date
    
    init(products: [Product], total: Int) {
        self.products = products
        self.total = total
        self.date = Date()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
