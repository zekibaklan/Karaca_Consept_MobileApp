//
//  CommentView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 14.03.2024.
//

import SwiftUI

struct CommentView: View {
  // MARK: - PROPERTIES
  
    @EnvironmentObject var shop: Shop
    @State private var selectedOrderIndex: Int = 0
    
  
  // MARK: - BODY
  
  var body: some View {
      NavigationView {
          VStack(alignment: .center, spacing: 0) {
              // MARK: - FORM
              Picker("Priority", selection: $selectedOrderIndex) {
                                  ForEach(0..<shop.orders.count) { index in
                                      let order = shop.orders[index]
                                      let firstSixCharacters = String(order.id.uuidString.prefix(6))
                                      Text("Sipariş No: \(firstSixCharacters)")
                                          .tag(index)
                                  }
                              }
              
              .padding(8)
              
                  .pickerStyle(.segmented)
              Form {
                                 Section(header: Text("Ürün Seçin")) {
                                     if let selectedOrder = shop.orders[safe: selectedOrderIndex] {
                                         ForEach(selectedOrder.products, id: \.id) { product in
                                             CommentItemListView(productImage: product.image, productName: product.name)
                                         }
                                     } else {
                                         Text("Ürünlere yorum yapabilmeniz için ürün satın almanız gerekmetedir.")
                                     }
                                 }
                             }
          }

      }
      
            
  }
}
extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
#Preview {
    CommentView()
        .environmentObject(Shop())
}
