//
//  FeaturedTabView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
      TabView {
        ForEach(airFryData) { airfryimage in
            FeaturedItemView(airfry: airfryimage)
            .padding(.top, 10)
            .padding(.horizontal, 15)
        }
      } //: TAB
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    FeaturedTabView()
}
