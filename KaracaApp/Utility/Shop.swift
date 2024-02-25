//
//  Shop.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
}
