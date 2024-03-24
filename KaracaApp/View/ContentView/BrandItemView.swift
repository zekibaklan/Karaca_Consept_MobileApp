//
//  BrandItemView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct BrandItemView: View {
 // MARK: - PROPERTY
 var brand: Brand

 // MARK: - BODY
 var body: some View {

  Image(brand.image)
   .resizable()
   .scaledToFit()
   .padding(3)
   .background(Color.white.cornerRadius(12))
   .background(
    RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
   )
 }
}

#Preview {
 BrandItemView(brand: brandData[0])
  .previewLayout(.sizeThatFits)
  .padding()
}
