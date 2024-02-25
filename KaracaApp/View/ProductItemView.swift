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
      VStack(alignment: .leading, spacing: 6, content: {
        // PHOTO
        ZStack {
            Image(product.image)
            .resizable()
            .scaledToFit()
            .padding(10)
        } //: ZSTACK
        .background(.secondary)
        .cornerRadius(12)
        
        // NAME
        Text(product.name)
          .font(.title3)
          .fontWeight(.black)
        
        // PRICE
        Text(product.formattedPrice)
          .fontWeight(.semibold)
          .foregroundColor(.gray)
      }) //: VSTACK
    }
}

#Preview {
    ProductItemView(product: productData[0])
        .previewLayout(.fixed(width: 200, height: 300))
        .padding()
        
}
