//
//  ProductModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation

struct Product: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let price: Double
  let description: String

  
  var formattedPrice: String { return "\(price) TL" }
}
