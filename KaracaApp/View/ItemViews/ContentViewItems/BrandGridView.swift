//
//  BrandGridView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERT
    
    let brand: [Brand]
  
    
    // MARK: - BODY
    
    var body: some View {
       
      ScrollView(.horizontal, showsIndicators: false, content: {
        LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
          ForEach(brand) { brand in
            BrandItemView(brand: brand)
          }
        }) //: GRID
        .frame(height: 200)
        .padding(15)
      }) //: SCROLL
    }
}

#Preview {
    BrandGridView(brand: brandData)
}
