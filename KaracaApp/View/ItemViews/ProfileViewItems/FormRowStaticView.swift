//
//  FormRowStaticView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 16.03.2024.
//


import SwiftUI

struct FormRowStaticView: View {
  // MARK: - PROPERTIES
  
  var icon: String
  var firstText: String
  var secondText: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(Color.gray)
        Image(systemName: icon)
          .foregroundColor(Color.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(firstText).foregroundColor(Color.gray)
      Spacer()
      Text(secondText)
    }
  }
}

// MARK: - PREVIEW
#Preview {
    FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
}
