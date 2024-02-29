//
//  SearchableView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 29.02.2024.
//

import SwiftUI

struct SearchableView: View {
    
    @State private var searchText = ""
    private var products: [Product] = productData
    
    var body: some View {
        NavigationView {
                  List {
                      ForEach(filteredProducts(searchText), id: \.id) { product in
                          HStack {
                              Image(product.image)
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 50, height: 50)
                                  .padding(.trailing,10)
                              Text(product.name)
                              Spacer()
                              Text("\(String(format: product.formattedPrice))")
                                  .foregroundColor(Color.gray.opacity(0.8))
                          }
                          .padding(.vertical)
                      }
                  }
                  .searchable(text: $searchText)
                  .navigationTitle("Ürünler")
              }
    }
    private func filteredProducts(_ query: String) -> [Product] {
           let lowercaseQuery = query.lowercased()
           return query.isEmpty ? products : products.filter { $0.name.lowercased().contains(lowercaseQuery) }
       }
}

#Preview {
    SearchableView()
}
