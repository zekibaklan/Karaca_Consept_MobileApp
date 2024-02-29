//
//  ProductRow.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 27.02.2024.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var shop: Shop
    var product : Product
    
    
    // MARK: - BODY

    var body: some View {
      HStack {
          Spacer()
        Image(product.image)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
          .background(Color.brown
            .opacity(0.1)
          )
         
          .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 5) {
            HStack {
              
                Text(product.name)
                .font(.title2)
            .fontWeight(.bold)
                Spacer()
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .onTapGesture {
                        shop.removeFromCart(product: product)
                    }
                    .padding(.trailing)
                
            }
            
          Text(product.formattedPrice)
            .font(.caption)
            .foregroundColor(Color.secondary)
           
           
        }
      } //: HSTACK
    }
}

#Preview {
    ProductRow( product: productData[0])
        .environmentObject(Shop())
}

