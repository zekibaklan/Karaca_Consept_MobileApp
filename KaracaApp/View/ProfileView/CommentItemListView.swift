//
//  CommentItemListView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 16.03.2024.
//

import SwiftUI

struct CommentItemListView: View {
  // MARK: - PROPERTIES
  var productImage: String = ""
  var productName: String = ""
  @State private var isCommentItemViewPresented = false

  // MARK: - BODY
  var body: some View {

    ZStack {
      Color("ThemeBG")
        .ignoresSafeArea()
      HStack {
        // MARK: - PRODUCT IMAGE
        Image(productImage)
          .resizable()
          .frame(width: 40, height: 40)

        // MARK: - PRODUCT NAME
        Text(productName)
        Spacer()

        // MARK: - PRODUCT COMMENT BUTTON
        Button(
          action: {

            isCommentItemViewPresented.toggle()

          },
          label: {
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
              .font(.system(size: 18, weight: .bold, design: .default))
              .padding()
              .frame(width: 50, height: 40)
              .background(.foreground)
              .opacity(0.4)
              .cornerRadius(9)

          }
        )
        .foregroundStyle(.foreground)

      }
      .sheet(
        isPresented: $isCommentItemViewPresented,
        content: {
          CommentItemView()
            .presentationDetents([.height(250)])
            .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
            .presentationCornerRadius(12)

        }
      )
      .scrollContentBackground(.hidden)
      .background(Color("ThemeBG"))
    }
  }

}

#Preview {
  ZStack {

    CommentItemListView(productImage: "makine1", productName: "AirFryer Pro Cook Siyah")

  }

}
