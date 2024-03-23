//
//  HeaderDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    var product : Product
    
    // MARK: - BODY
    
    var body: some View {
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Sadece Karaca'da")
              .fontWeight(.light)
        
          Text(shop.selectedProduct?.name ?? product.name)
          .font(.largeTitle)
          .fontWeight(.black)
      }) //: VSTACK
      .foregroundColor(.white)
    }}

#Preview {
    HeaderDetailView(product: productData[0])
        .environmentObject(Shop())
        .padding()
        .background(Color.gray)
}
