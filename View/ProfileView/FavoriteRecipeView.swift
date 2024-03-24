//
//  FavoriteRecipeView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 13.03.2024.
//

import SwiftUI

struct FavoriteRecipeView: View {
  // MARK: - PROPERTIES
  var recipes: [Recipe] = recipesData

  @State private var selectedRecipe: Recipe?
  @State private var isGridViewActive: Bool = false
  @State private var showModal: Bool = false
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"

  // MARK: - GRIDSWITCH FUNCTION
  func gridSwitch() {
    withAnimation(.easeInOut(duration: 1)) {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 2 + 1)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")

      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        break
      }
    }
  }

  // MARK: - BODY
  var body: some View {
    NavigationView {
      if recipes.filter({ $0.isFavorite }).count != 0 {
        ScrollView(.vertical, showsIndicators: false) {
          LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
            ForEach(recipes.filter({ $0.isFavorite })) { recipe in

              ZStack(alignment: .bottomLeading) {

                // MARK: - COOKING IMAGE
                Image(recipe.cookingImage)
                  .resizable()
                  .scaledToFit()
                  .cornerRadius(12)

                // MARK: - COOKING NAME
                Text(gridColumn != 2 ? recipe.cookingName : "")
                  .font(.system(.title, design: .serif))
                  .fontWeight(.bold)
                  .foregroundColor(Color.white)
                  .shadow(radius: 3)
                  .padding(.horizontal, 10)
                  .padding(.bottom, 10)
              }
              .padding(.vertical, 8)
              .padding(.horizontal, 12)
              .onTapGesture {
                selectedRecipe = recipe
                showModal = true
              }

            }

          }

          .sheet(isPresented: $showModal) {
            RecipeDetailView(recipe: selectedRecipe ?? recipesData[0])
          }
        }
        .scrollContentBackground(.hidden)
        .background(Color("ThemeBG"))

      } else {
        EmptyScreenView(image: "fork.knife.circle", text: "Henüz favori tarifleriniz bulunmuyor.")
      }

    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {
          gridSwitch()

        }) {
          Image(systemName: toolbarIcon)
            .font(.title2)
            .foregroundStyle(.foreground)

        }

      }

    }

    .navigationBarBackButtonHidden()
    .navigationBarItems(leading: CustomBackButton())
  }

}

#Preview {
  FavoriteRecipeView()
    .ignoresSafeArea()

}
