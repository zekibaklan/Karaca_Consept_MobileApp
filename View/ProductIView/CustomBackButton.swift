//
//  NavigationBarDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct CustomBackButton: View {
  // MARK: - PROPERTY
  @Environment(\.presentationMode) var presentationMode

  // MARK: - BODY
  var body: some View {
    HStack {
      Button(
        action: {
          withAnimation(.easeIn) {
            self.presentationMode.wrappedValue.dismiss()
            feedback.impactOccurred()

          }
        },
        label: {
          Image(systemName: "chevron.left")
            .font(.title)
            .foregroundStyle(.white)
        })

      Spacer()

    }  //: HSTACK
  }
}

#Preview {
  CustomBackButton()
    .padding()
    .background(Color("ThemeBG"))
}
