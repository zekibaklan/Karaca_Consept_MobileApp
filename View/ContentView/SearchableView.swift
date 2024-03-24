//
//  SearchableView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 29.02.2024.
//

import SwiftUI

struct SearchableView: View {
 // MARK: - PROPERTIES
 @State private var searchText = ""
 private var products: [Product] = productData

 // MARK: - BODY
 var body: some View {

  VStack {
   // MARK: - ITEM LIST
   List {
    ForEach(filteredProducts(searchText), id: \.id) { product in
     NavigationLink(destination: ProductDetailView(product: product)) {
      HStack {
          
       Image(product.image)
        .resizable()
        .scaledToFit()
        .frame(width: 50, height: 50)
        .padding(.trailing, 10)
          
       Text(product.name)
       Spacer()
       Text("\(String(format: product.formattedPrice))")
        .foregroundColor(Color.gray.opacity(0.8))

      }
     }
     .padding(.vertical)
    }
   }
   .scrollContentBackground(.hidden)
   .background(Color("ThemeBG"))
   .searchable(text: $searchText)
   .navigationTitle("Ürünler")
   .navigationBarTitleDisplayMode(.automatic)
  }
  .navigationBarItems(leading: CustomBackButton())
  .navigationBarBackButtonHidden()

 }
 // MARK: - FILTERED PRODUCTS FUNCTION
 private func filteredProducts(_ query: String) -> [Product] {
  let lowercaseQuery = query.lowercased()
  return query.isEmpty ? products : products.filter {$0.name.lowercased().contains(lowercaseQuery) }
 }

}

#Preview {
 SearchableView()
  .environmentObject(Shop())
}
