//
//  AddToCartDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    var product : Product
    
    // MARK: - BODY
    
    var body: some View {
      Button(action: {
          
          
          shop.addToCart(product: (shop.selectedProduct)!)
          
        feedback.impactOccurred()
      }, label: {
        Spacer()
        Text("Add to cart".uppercased())
          .font(.system(.title2, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.black)
        Spacer()
      }) //: BUTTON
      .padding(15)
      .background(
        Color(
            .brown
        )
      )
      .clipShape(Capsule())
    }

}

#Preview {
    AddToCartDetailView(product: productData[3])
        .environmentObject(Shop())
        .padding()
}
