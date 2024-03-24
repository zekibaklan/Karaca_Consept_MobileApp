//
//  CartView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct CartView: View {
  // MARK: - PROPERTIES

  @EnvironmentObject var shop: Shop

  // MARK: - BODY

  var body: some View {
    ZStack {
      Color("ThemeBG")
        .ignoresSafeArea(.all)
      // MARK: - IF PAYMENT SUCCES
      if shop.paymentSuccess {
        CompletedView()

      } else {
        if shop.shopProduct.count > 0 {

          VStack {
            // MARK: - PRODUCT ROW
            ScrollView {
              ForEach(shop.shopProduct, id: \.id) { product in
                ProductRow(product: product)
                  .padding(.horizontal, 8)
              }
            }
            .padding(.bottom, 50)
            HStack {
              Spacer()
              Group {
                Text("Toplam:")
                Text("\((shop.total))₺").bold()
              }

              Spacer()
              // MARK: - PAYMENT BUTTON
              PaymentButton(action: {
                shop.pay()
              })
              .padding(.trailing, 12)
            }
            .offset(y: -50)
            .padding(.bottom, 24)
          }
          .padding(.top)
        } else {
          // MARK: - EMPTYSCREEN VIEW
          EmptyScreenView(image: "cart.badge.plus", text: "Sepetiniz şimdilik boş.")
        }
      }
    }
    .onDisappear {
      if shop.paymentSuccess {
        shop.paymentSuccess = false
      }
    }
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView().environmentObject(Shop())
  }
}
