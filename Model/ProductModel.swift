//
//  ProductModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation

struct Product: Codable,Hashable, Identifiable {
    
  var id = UUID()
  let itemColor : String
  let name: String
  let image: String
  let price: Int 
  let description: String
  var isFavorite: Bool
  let color: [Double]
    
  var red: Double { return color[0] }
  var green: Double { return color[1] }
  var blue: Double { return color[2] }
  
  var formattedPrice: String { return "\(price)₺" }
}


