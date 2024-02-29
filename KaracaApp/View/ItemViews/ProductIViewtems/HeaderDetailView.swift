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
    let sampleProduct: Product = productData[0]
    
    // MARK: - BODY
    
    var body: some View {
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Sadece Karaca'da")
        
        Text(shop.selectedProduct?.name ?? sampleProduct.name)
          .font(.largeTitle)
          .fontWeight(.black)
      }) //: VSTACK
      .foregroundColor(.white)
    }}

#Preview {
    HeaderDetailView()
        .environmentObject(Shop())
        .padding()
        .background(Color.gray)
}
