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
            Color("ThemeBG")
                .ignoresSafeArea(.all)
            if shop.paymentSuccess {
                CompletedView()
                
            } else {
                if shop.shopProduct.count > 0 {
                    
                    
                    
                    VStack {
                        ScrollView{
                            ForEach(shop.shopProduct,id: \.id) { product in
                                ProductRow(product: product)
                                
                                    .padding(.horizontal,8)
                                
                            }
                            
                            
                        }
                        
                        .padding(.bottom,50)
                        
                        
                        
                        
                        HStack {
                            Spacer()
                            Group {
                                Text("Toplam:")
                                Text("\((shop.total))₺").bold()
                            }
                            
                            Spacer()
                            PaymentButton(action: {
                                shop.pay()
                                
                            })
                            .padding(.trailing,12)
                            
                        }
                        
                        .offset(y: -50)
                        .padding(.bottom,24)
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    .padding(.top)
                }
                else {
                    
                    EmptyScreenView(image: "cart.badge.plus",text: "Sepetiniz şimdilik boş.")
                    
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
