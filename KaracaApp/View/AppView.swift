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
            
            KaracaView()
              .tabItem({
                Image(systemName: "book")
                Text("Anasayfa")
                      .tag(0)
              })
            ContentView()
              .tabItem({
             
                Image(systemName: "cart.badge.plus")
                Text("Mağaza")
                      .tag(1)
              })

            RecipeView()
              .tabItem({
             
                Image(systemName: "fork.knife")
                Text("Tarifler")
                      .tag(1)
              })
            
              
          }
        
        .accentColor(Color.primary)
          
        }
        
    }


#Preview {
        AppView()
        .environmentObject(Shop())
}
