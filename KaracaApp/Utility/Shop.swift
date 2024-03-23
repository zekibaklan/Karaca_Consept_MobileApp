//
//  Shop.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? = nil
    
    @Published private(set) var orders: [Order] = []
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
           if let index = shopProduct.firstIndex(where: { $0.id == product.id }) {
                       shopProduct.remove(at: index)
                       total -= product.price
        }
       }
    
    func pay() {
            paymentHandler.startPayment(products: shopProduct, total: total) { success in
                self.paymentSuccess = success
                
                if success {
                    let order = Order(products: self.shopProduct, total: self.total)
                    self.orders.append(order)
                }
                
                self.shopProduct = []
                self.total = 0
            }
        }
       
    
}
