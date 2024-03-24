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
  var product: Product

  // MARK: - STATE

  @State private var addToCartMessage = "Sepete Ekle".uppercased()
  @State private var itemAddedToCart = false

  // MARK: - BODY

  var body: some View {
    Button(
      action: {
        shop.addToCart(product: product)
        addToCartMessage = "SEPETE EKLENDİ"
        itemAddedToCart = true
        feedback.impactOccurred()
      },
      label: {
        Spacer()
        HStack {

          Text(addToCartMessage)
            .font(.system(.title2, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
          if itemAddedToCart {
            Image(systemName: "checkmark.circle.fill")
              .foregroundColor(.black)
          }
        }
        Spacer()
      }
    )  //: BUTTON
    .padding(15)
    .background(
      Color(
        red: product.red,
        green: product.green,
        blue: product.blue
      )
    )
    .clipShape(Capsule())
    .disabled(itemAddedToCart)
  }
}

#Preview {
  AddToCartDetailView(product: productData[0])
    .environmentObject(Shop())
    .padding()
}
