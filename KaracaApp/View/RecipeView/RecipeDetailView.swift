//
//  RecipeDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct RecipeDetailView: View {
  // MARK: - PROPERTIES
  var recipe: Recipe
  @State private var pulsate: Bool = false
  @Environment(\.presentationMode) var presentationMode

  // MARK: - BODY
  var body: some View {
    ScrollView {
      VStack {
        // MARK: - COOKING IMAGE
        Image(recipe.cookingImage)
          .resizable()
          .scaledToFit()

        // MARK: - COOKING NAME
        Group {
          Text(recipe.cookingName)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.brown)
            .padding(.top, 10)
            
          // MARK: - COOKING INFO VIEW
          CookingInfoView(recipe: recipe)
            .padding(.top, -5)

          // MARK: - COOKING INGREDIENTS
          Text("Malzemeler")
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.brown)
            .padding(.top, 10)

          VStack(alignment: .leading, spacing: 5) {
            ForEach(recipe.ingredients, id: \.self) { item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              }
            }
          }

          // MARK: - COOKING INSTRUCTIONS

          Text("Yapılış")
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.brown)
            .padding(.top, 10)

          ForEach(recipe.instructions, id: \.self) { item in
            VStack(alignment: .center, spacing: 5) {
              Image(systemName: "chevron.down.circle")
                .resizable()
                .frame(width: 42, height: 42, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(.brown)

              Text(item)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.system(.body, design: .serif))
                .frame(minHeight: 100)
            }
          }

        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)

      }
      .overlay(
        HStack {
          Spacer()
          VStack {

            // MARK: - TRAILING BUTTON
            Button(
              action: {
                // ACTION
                self.presentationMode.wrappedValue.dismiss()
              },
              label: {
                Image(systemName: "chevron.down.circle.fill")
                  .font(.title)
                  .foregroundColor(Color.white)
                  .shadow(radius: 4)
                  .opacity(self.pulsate ? 1 : 0.6)
                  .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                  .animation(
                    Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                    value: pulsate)
              }
            )
            .padding(.trailing, 20)
            .padding(.top, 24)
            Spacer()
          }
        }
      )
      .onAppear {
        self.pulsate.toggle()
      }
      Text(
        "*Bu tarifi Air Pro Cool Manuel’de, tarifte belirtilen pişirme sıcaklığını ve pişirme süresini ayarlayarak hazırlayabilirsiniz."
      )
      .font(.footnote)
      .padding()

    }
    .edgesIgnoringSafeArea(.top)
  }
}

#Preview {
  RecipeDetailView(recipe: recipesData[0])
}
