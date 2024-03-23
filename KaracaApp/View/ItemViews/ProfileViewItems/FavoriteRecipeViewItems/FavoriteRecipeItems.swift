//
//  FavoriteRecipeItems.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 13.03.2024.
//

import SwiftUI

struct FavoriteRecipeItems: View {
    var recipe : Recipe
    
    var body: some View {
        ZStack(alignment : .bottomLeading) {
            
            
            Image(recipe.cookingImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
            
            
            Text(recipe.cookingName)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .shadow(radius: 3)
                .padding(.horizontal,10)
                .padding(.bottom,10)
        }

    }
}

#Preview {
    FavoriteRecipeItems(recipe: recipesData[0])
        .padding()
}
