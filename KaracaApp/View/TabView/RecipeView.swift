//
//  ContentView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI

struct RecipeView: View {
    
    var recipes: [Recipe] = recipesData
    
    var body: some View {
        
        
        
        
        
        NavigationView {
          
            
            
            ZStack {
                Color("ThemeBG")
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(alignment: .center, spacing: 20) {
                        ForEach(recipes) { item in
                            RecipeCardView(recipe: item)
                            
                        }
                    }
                    
                    .padding(.horizontal)
                    
                }
                .navigationBarTitle("#LezzetinizeSağlık Dedirtecek Tarifler")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
}

#Preview {
    
    RecipeView()
    
    
    
    
}
