//
//  EmptyScreenView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 28.02.2024.
//

import SwiftUI

struct EmptyScreenView: View {
  // MARK: - PROPERTY
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack(spacing: 20) {
      // MARK: - HEADER
      
      Spacer()
      
      ZStack {
        CircleViewGroup(ShapeColor: .gray, ShapeOpacity: 0.1)
        
        Image("sepet")
          .resizable()
          .scaledToFit()
          .padding()
          .offset(y: isAnimating ? 35 : -35)
          .animation(
            Animation
              .easeInOut(duration: 4)
              .repeatForever()
            , value: isAnimating
          )
      }
      
      // MARK: - CENTER
      
        VStack {
            Text("Sepetiniz Şimdilik Boş")
            .font(.title)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
       
            Text("Dilediğiniz zaman ürün ekleyip alışverişe başlayabilirsiniz.")
              .font(.title3)
              .fontWeight(.light)
              .foregroundColor(.secondary)
              .multilineTextAlignment(.center)
              .padding()
        }
      
      // MARK: - FOOTER
      
      Spacer()
      
      
    } //: VSTACK
    .onAppear(perform: {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        isAnimating = true
      })
    })
  }
}

#Preview {
    EmptyScreenView()
}
