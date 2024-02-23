//
//  CardView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI


struct ImageView: View {
   
    
    var recipe: Recipe
     
  
   
    var body: some View {
        
        var screen = UIScreen.main.bounds

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
                            Image(systemName: "info.circle")
                                .font(Font.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: .black, radius: 2,x: 0,y: 0)
                            .padding(.trailing,20)
                            .padding(.top,22)
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
                
                //RATES
          
                
                //COOKING
               
                
            }
            .padding()
            
       
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black, radius: 8, x: 0, y: 5)
       
//        .onTapGesture {
////            hapticImpact.impactOccurred()
////            showModel = true
//        }
//        .sheet(isPresented: $showModel) {
//            RecipeDetailView(recipe: recipe)
//        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            ImageView(recipe: recipesData[0])
               
                
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



