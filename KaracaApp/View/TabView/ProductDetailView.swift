//
//  ProductDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - PROPERTY
    let sampleProduct: Product = productData[0]
    @EnvironmentObject var shop: Shop
    var product : Product
    // MARK: - BODY
    
    var body: some View {
      VStack(alignment: .leading, spacing: 5, content: {
        // NAVBAR
        CustomBackButton()
          .padding(.horizontal)
          .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

        // HEADER
        HeaderDetailView()
          .padding(.horizontal)
        
        // DETAIL TOP PART
        TopPartDetailView()
          .padding(.horizontal)
          .zIndex(1)
        
        // DETAIL BOTTOM PART
        VStack(alignment: .center, spacing: 0, content: {
          // RATINGS + SIZES
          RatingsSizesDetailView()
            .padding(.top, -20)
            .padding(.bottom, 10)
          
          // DESCRIPTION
          ScrollView(.vertical, showsIndicators: false, content: {
            Text(shop.selectedProduct?.description ?? sampleProduct.description)
              .font(.system(.body, design: .rounded))
              .foregroundColor(.gray)
              .multilineTextAlignment(.leading)
              
              // QUANTITY + FAVOURITE
              QuantityFavouriteDetailView()
                .padding(.vertical, 10)
              
              
          }) //: SCROLL
            // ADD TO CART
            AddToCartDetailView( product: sampleProduct)
              .padding(.bottom, 20)
        }) //: VSTACK
        .padding(.horizontal)
        .background(
          Color.white
            .clipShape(CustomShape())
            .padding(.top, -105)
        )
      }) //: VSTACK
      .zIndex(0)
      .ignoresSafeArea(.all, edges: .all)
      .background(
        Color(
            .brown
        ).ignoresSafeArea(.all, edges: .all)
      )
    }
}

#Preview {
    ProductDetailView(product: productData[1])
        .environmentObject(Shop())
        .previewLayout(.fixed(width: 375, height: 812))
        .background(Color.gray)
        
}
