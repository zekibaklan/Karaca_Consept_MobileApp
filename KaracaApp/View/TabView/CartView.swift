//
//  CartView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        ZStack {
            if shop.paymentSuccess {
                CompletedView()
            } else {
                if shop.shopProduct.count > 0 {
                    ScrollView {
                        ForEach(shop.shopProduct, id: \.id) { product in
                            ProductRow(product: product)
                        }
                        HStack {
                            Text("Your cart total is ")
                            Spacer()
                            Text("\((shop.total))₺").bold()
                        }
                        .padding()
                        Spacer()
                        PaymentButton(action: {
                            shop.pay()
                        })
                        .padding()
                    
                                  
                                }
                    
                    .padding(.top)
                }
                else {

                   EmptyScreenView()
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
