//
//  ContentView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var recipes: [Recipe] = recipesData
    
    var body: some View {
        
        
        
        
            
            NavigationView {
                
             
                ScrollView {
                    
                        VStack(alignment: .center, spacing: 20) {
                          ForEach(recipes) { item in
                            RecipeView(recipe: item)
                                 
                          }
                        }
                
                        .padding(.horizontal)
                    
                }
                .navigationBarTitle("#LezzetinizeSağlık Dedirtecek Tarifler")
                .navigationBarTitleDisplayMode(.inline)
            }
    }
     
}

#Preview {

        ContentView()
        
        
  
  
}
