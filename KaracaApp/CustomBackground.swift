//
//  CustomBackground.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI

import SwiftUI

struct CustomBackground: View {
    
  var body: some View {
    ZStack {
      // MARK: - 3. DEPTH
      
        Color.clear
        .cornerRadius(40)
        .offset(y: 12)
      
      // MARK: - 2. LIGHT
      
      Color.black
        .cornerRadius(40)
        .offset(y: 3)
        .opacity(0.85)
      
      // MARK: - 1. SURFACE
      
      LinearGradient(
        colors: [
          .white,
          .gray],
        startPoint: .top,
        endPoint: .bottom
      )
      .cornerRadius(40)
    }
  }
}

#Preview {
    CustomBackground()
        .padding()
}
