//
//  VideoButtonItems.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 1.03.2024.
//

import SwiftUI

struct VideoButtonItems: View {
  // MARK: - PROPERTIES
  @State private var isVideoView: Bool = false
  var product: Product

  // MARK: - BODY
  var body: some View {

    Button(
      action: {
        isVideoView = true

      },
      label: {
        HStack {

          Image(systemName: "play.rectangle.fill")
            .font(.title2)
          Text("Videolu Ürün")
            .font(.footnote)
        }
        .font(.footnote)
        .fontWeight(.heavy)
        .foregroundStyle(Color(red: product.red, green: product.green, blue: product.blue))
        .frame(width: 140, height: 35, alignment: .center)
        .multilineTextAlignment(.center)
        .lineLimit(1)
        .cornerRadius(5)

        .background(

          RoundedRectangle(cornerRadius: 5)
            .stroke(Color(red: product.red, green: product.green, blue: product.blue), lineWidth: 2)
        )

      }
    )
    .sheet(isPresented: $isVideoView) {
      VideoView()
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all)
        .presentationDetents([.height(200)])
        .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        .presentationCornerRadius(12)

    }
  }

}

#Preview {
  VideoButtonItems(product: productData[0])
}
