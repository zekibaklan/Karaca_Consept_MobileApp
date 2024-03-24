//
//  ProductItemView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct ProductItemView: View {
 // MARK: - PROPERTY
 let product: Product

 // MARK: - BODY
 var body: some View {

  VStack(
   alignment: .leading, spacing: 6,
   content: {
    // MARK: - PRODUCT IMAGE
    ZStack {
     Image(product.image)
      .resizable()
      .scaledToFit()
      .padding(10)
    }
    .background(Color(red: product.red, green: product.green, blue: product.blue))
    .cornerRadius(12)

    // MARK: - PRODUCT NAME
    Text("\(product.name)")
     .font(.title3)
     .fontWeight(.bold)
    // PRICE
    Text(product.formattedPrice)
     .fontWeight(.semibold)
     .foregroundColor(.gray)

   })
 }
}

#Preview {
 ProductItemView(product: productData[0])
  .previewLayout(.fixed(width: 200, height: 300))
  .padding()

}
