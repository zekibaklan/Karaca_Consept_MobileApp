//
//  RatingsSizesDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    // MARK: - PROPERTY
    
    @State private var selectedRating = 0
    @State private var isFavorite = false
    
    @EnvironmentObject var shop: Shop
    var product : Product
    // MARK: - BODY
    
    var body: some View {
        
        
        HStack(alignment: .top, spacing: 3) {
            // RATINGS
            VStack(alignment: .leading, spacing: 3) {
                Text("Yıldız")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self) { index in
                        Button(action: {
                            selectedRating = index
                        }) {
                            Image(systemName: index <= selectedRating ? "star.fill" : "star")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.gray.cornerRadius(5))
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            
            Spacer()
            
            // SIZES
            VStack(alignment: .trailing, spacing: 3) {
                Text(product.isFavorite ? "Favori Çıkar" : "Favori Ekle")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Button(action: {
                                   
                    toggleFavorite()
                }) {
                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                                       .font(.footnote)
                                       .fontWeight(.heavy)
                                       .foregroundColor(.pink)
                                       .frame(width: 28, height: 28, alignment: .center)
                                       .cornerRadius(5)
                                       .background(
                                           RoundedRectangle(cornerRadius: 5)
                                               .stroke(Color.pink, lineWidth: 2)
                                       )
                               }
                .onAppear 
                {
                           isFavorite = shop.selectedProduct?.isFavorite ?? false
                       }
            }
        } //: HSTACK
    }
    func toggleFavorite() {
            if let index = productData.firstIndex(where: { $0.id == product.id }) {
                productData[index].isFavorite.toggle()
                isFavorite = productData[index].isFavorite
                shop.selectedProduct?.isFavorite = isFavorite
            }
        }
}






#Preview {
    RatingsSizesDetailView(product: productData[0])
        .environmentObject(Shop())
        .padding()
}
