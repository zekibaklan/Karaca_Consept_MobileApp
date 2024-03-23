//
//  ProductDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - PROPERTY
    var product : Product
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    
    var body: some View {
      
            VStack(alignment: .leading, spacing: 5, content: {
                
                // HEADER
                HeaderDetailView(product: product)
                    .padding(.horizontal)
                    .padding(.top,100)
                
                // DETAIL TOP PART
                HStack {
                   
                    
                    ZStack {
                        VideoButtonItems(product: product)
                            .offset(x:-110,y: 55)
                         
                        TopPartDetailView(product: product)
                            .padding(.horizontal)
                         
                    }
                  
                
                }
                
                .zIndex(1)
                 
                
                
                
                
                // DETAIL BOTTOM PART
                VStack(alignment: .center, spacing: 0, content: {
                    
                    // RATINGS + SIZES
                    RatingsSizesDetailView(product: product)
                    
                        .padding(.bottom, 10)
                    
                    // DESCRIPTION
                    ScrollView(.vertical, showsIndicators: false, content: {
                        Text(product.description)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        
                        
                    }) //: SCROLL
                    // ADD TO CART
                    AddToCartDetailView( product: product)
                        .padding(.bottom,110)
                }) //: VSTACK
                .padding(.horizontal)
                .background(
                    Color("ThemeBG")
                        .clipShape(CustomShape())
                        .padding(.top, -105)
                )
            }) //: VSTACK
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .all)
            .background(
                Color(
                    red:   product.red,
                    green: product.green,
                    blue:  product.blue)
            )
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: CustomBackButton())
        }
        
    }


#Preview {
    ProductDetailView(product: productData[0])
        .environmentObject(Shop())
        .previewLayout(.fixed(width: 375, height: 812))
    
    
}
