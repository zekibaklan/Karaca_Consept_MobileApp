//
//  AppView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct MainView: View {
 // MARK: - PROPERTIES
    
  @EnvironmentObject var shop: Shop
  @State private var tabSelected: Tab = .house

  init() {
    UITabBar.appearance().isHidden = true
  }
 // MARK: - BODY
    
  var body: some View {

    ZStack {
 // MARK: - Switch View
      switch tabSelected {
      case .house:
        ContentView()
      case .map:
        MapView()
      case .cart:
        CartView()
      case .leaf:
        RecipeView()
      case .person:
        ProfileView()
      }
      VStack {
        Spacer()
        CustomTabView(selectedTab: $tabSelected)
          .padding(.bottom, -10)
      }
    }
  }
}

#Preview {
  MainView()
    .environmentObject(Shop())
}
