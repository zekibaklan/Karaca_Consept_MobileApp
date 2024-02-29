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
    
    
    var body: some View {
        HStack(spacing : 20) {
            
       
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .background(Color.brown)
                    .cornerRadius(10)
              
                
        
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text(product.name)
                    .bold()
                Text(product.formattedPrice)
            })
            Spacer()
            Image(systemName: "trash")
                .foregroundStyle(.red)
                .onTapGesture {
                    shop.removeFromCart(product: product)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    ProductRow( product: productData[0])
        .environmentObject(Shop())
}
