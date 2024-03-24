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
  var image: String = ""
  var text: String = ""

  // MARK: - BODY
  var body: some View {
    ZStack {
      Color("ThemeBG")
        .ignoresSafeArea()
      VStack(spacing: 20) {

        Spacer()

        ZStack {
          CircleViewGroup(ShapeColor: .gray, ShapeOpacity: 0.1)

          Image(systemName: image)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.gray)
            .frame(width: 300, height: 350)
            .padding()
            .offset(y: isAnimating ? 35 : -35)
            .animation(
              Animation
                .easeInOut(duration: 4)
                .repeatForever(), value: isAnimating
            )
        }

        Text(text)
          .layoutPriority(0.5)
          .font(.system(.title2, design: .serif))
          .fontWeight(.bold)
          .foregroundStyle(.gray)
        Spacer()

      }  //: VSTACK
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(
          deadline: .now() + 0.5,
          execute: {
            isAnimating = true
          })
      })
    }

  }

}

#Preview {
  EmptyScreenView(image: "cart.badge.plus", text: "Sepetiniz şimdilik boş.")

}
