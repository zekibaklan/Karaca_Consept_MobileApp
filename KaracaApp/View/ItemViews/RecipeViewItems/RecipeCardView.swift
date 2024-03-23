//
//  CardView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI


struct RecipeCardView: View {
   
    var recipes: [Recipe] = recipesData
    var recipe: Recipe
    @State private var isFavorite = false
    
    @State private var showModal: Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
   
    var body: some View {
        
       

        VStack(alignment: .leading,spacing: 0) {
            // CARD IMAGE
            ZStack {
                Image(recipe.cookingImage)
                .resizable()
                .scaledToFit()
                .clipShape(CornerShape(cornerRadius: 75, isLeft: recipe.index % 2 == 0))
                
                .overlay(
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                toggleFavorite()
                            }, label: {
                                Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                                    .font(Font.title.weight(.light))
                                    .foregroundColor(.white)
                                    .imageScale(.small)
                                    .shadow(color: .black, radius: 2,x: 0,y: 0)
                                .padding(.trailing,20)
                                .padding(.top,22)
                                
                            })
                            .onAppear {
                                isFavorite = recipe.isFavorite
                                   }

                            Spacer()
                        }
                       
                    })
              
                
                
              
            }
            
            
            VStack(alignment : .center,spacing: 12) {
                // TITLE
                Text(recipe.cookingName)
                    .font(.system(.title2,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    
                    .lineLimit(1)
                // HEADLINE
                CookingInfoView(recipe: recipe)
                    .padding(.vertical,8)
               
                
            }
            .padding()
            
       
        }
        .background(Color("ThemeBG"))
        .cornerRadius(12)
        .shadow(color: .black, radius: 8, x: 0, y: 5)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
          RecipeDetailView(recipe: self.recipe)
        }
       

    }
     func toggleFavorite() {
         if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipesData[index].isFavorite.toggle()
             isFavorite = recipesData[index].isFavorite
             
                 }
        }
    }

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            RecipeCardView(recipe: recipesData[0])
               
                
        }
           
    }
}

struct CornerShape: Shape {
    var cornerRadius: CGFloat = .zero
    var isLeft: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()
        if isLeft {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        path.closeSubpath()
        return path
    }
}



