//
//  TitleView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 25.02.2024.
//

import SwiftUI

struct TitleView: View {

 // MARK: - PROPERTY
 var title: String

 // MARK: - BODY
 var body: some View {

  HStack {
   Text(title)
    .font(.largeTitle)
    .fontWeight(.heavy)

   Spacer()
  }  //: HSTACK
  .padding(.horizontal)
  .padding(.top, 15)
  .padding(.bottom, 10)
 }
}

#Preview {
 TitleView(title: "Ürünler")
}
