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
      
        Image(product.image)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
          .background(Color(red: product.red, green: product.green, blue: product.blue)
            .opacity(0.5)
          )
         
          .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 5) {
            HStack {
            
                Text(product.name)
                .font(.title3)
                .fontWeight(.semibold)
               
            
                Spacer()
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .onTapGesture {
                        shop.removeFromCart(product: product)
                    }
                    .padding(.trailing)
                
            }
            
            Text("Renk : \(product.itemColor)")
              .font(.caption)
              .foregroundColor(Color.secondary)
            
          Text(product.formattedPrice)
            .font(.caption)
            .foregroundColor(Color.secondary)
           
           
        }
      } //: HSTACK
      
      .overlay(
              RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.gray, lineWidth: 1)
                
          )
    }
}

#Preview {
    ProductRow( product: productData[0])
        .environmentObject(Shop())
}

