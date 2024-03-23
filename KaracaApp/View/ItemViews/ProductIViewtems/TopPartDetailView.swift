//
//  TopPartDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct TopPartDetailView: View {
    // MARK: - PROPERTY
    var product : Product
    @EnvironmentObject var shop: Shop
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
      HStack(alignment: .center, spacing: 6, content: {
          
          
        // PRICE
        VStack(alignment: .leading, spacing: 6, content: {
          Text("Özel Fiyat")
            .fontWeight(.semibold)
        
          Text(product.formattedPrice)
            .font(.largeTitle)
            .fontWeight(.black)
            .scaleEffect(1.35, anchor: .leading)
           
            
        })
        .foregroundStyle(.white)
        .padding(.bottom)
        .offset(y: isAnimating ? -50 : -75)
        
          Spacer(minLength: 30)
        
        // PHOTO
        Image(product.image)
          .resizable()
          .scaledToFit()
          .offset(y: isAnimating ? 0 : -35)
      }) //: HSTACK
      .onAppear(perform: {
        withAnimation(.easeOut(duration: 0.75)) {
          isAnimating.toggle()
        }
      })
    }
}

#Preview {
    TopPartDetailView(product: productData[0])
        .background(.brown)
        .environmentObject(Shop())
        .padding()
}
