//
//  AppView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var shop: Shop
    
    
    
    var body: some View {
        TabView {
            
            
            ContentView()
              .tabItem({
             
                Image(systemName: "house")
                Text("Anasayfa")
                      .tag(1)
              })

            MapView()
              .tabItem({
             
                Image(systemName: "location")
                Text("Harita")
                      .tag(1)
              })
            RecipeView()
              .tabItem({
             
                Image(systemName: "fork.knife")
                Text("Tarifler")
                      .tag(1)
              })
            CartView()
              .tabItem({
                  ZStack {
                      Image(systemName: "cart.badge.plus")
                     
                         Circle()
                  }
                Text("Mağaza")
                      .tag(0)
              })
            
              
          }
        
        .accentColor(Color.primary)
          
        }
        
    }


#Preview {
        AppView()
        .environmentObject(Shop())
}
