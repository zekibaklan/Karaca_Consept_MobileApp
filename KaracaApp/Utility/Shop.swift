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
    
    
    @Published private(set) var shopProduct : [Product] = []
    @Published private(set) var total : Int = 0
    
    // Payment-related variables
        let paymentHandler = PaymentHandler()
        @Published var paymentSuccess = false
    
    // Functions to add and remove from cart
       func addToCart(product: Product) {
           shopProduct.append(product)
           total += product.price
       }
       
       func removeFromCart(product: Product) {
           shopProduct = shopProduct.filter { $0.id != product.id }
           total -= product.price
       }
    
    func pay() {
            paymentHandler.startPayment(products: shopProduct, total: total) { success in
                self.paymentSuccess = success
                self.shopProduct = []
                self.total = 0
            }
        }
       
    
}
