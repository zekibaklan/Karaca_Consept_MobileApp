//
//  AirFryInfo.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 7.01.2024.
//

import SwiftUI

struct CookingInfoView: View {
    
    var recipe: Recipe
    
    
    var body: some View {
     
      
        HStack(alignment: .center) {
            Spacer()
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Pişirme Süresi : \(recipe.cookingTime)")
            }
            Spacer()
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Pişirme Derecesi : \(recipe.cookingDegrees)")
            }
            Spacer()

        }
      
        .font(.footnote)
        .foregroundColor(.gray)
      
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        CookingInfoView(recipe: recipesData[0])
    }
}
