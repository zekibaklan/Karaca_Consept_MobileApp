//
//  FeaturedItemView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct FeaturedItemView: View {
 // MARK: - PROPERTY
 let airfry: airFryModel
 @State private var showHeadline: Bool = false

 var slideInAnimation: Animation {
  Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
   .speed(1)
   .delay(0.25)
 }

 // MARK: - BODY
 var body: some View {

  ZStack {
      
   // MARK: - AIRFRYER IMAGE
   Image(airfry.image)
    .resizable()
    .scaledToFit()
    .cornerRadius(12)
      
   // MARK: - AIRFRYER HEADLINE
   VStack(alignment: .leading, spacing: 2) {
    Text(airfry.headline)
     .font(.system(.title, design: .serif))
     .fontWeight(.bold)
     .foregroundColor(Color.white)
     .shadow(radius: 3)
       
    // MARK: - AIRFRYER SUBHEADLINE
    Text(airfry.subheadline)
     .font(.footnote)
     .lineLimit(2)
     .multilineTextAlignment(.leading)
     .foregroundColor(Color.white)
     .shadow(radius: 3)
   }
   .padding(.vertical, 0)
   .padding(.horizontal, 40)
   .frame(width: 300, height: 105)
   //          .background(Color("ColorBlackTransparentLight"))

   .frame(width: 285, height: 105, alignment: .center)
   .offset(x: -60, y: showHeadline ? 40 : 220)
   .animation(slideInAnimation, value: showHeadline)
   .onAppear(perform: {
    showHeadline = true
   })
   .onDisappear(perform: {
    showHeadline = false
   })
  }

 }
}

#Preview {
 FeaturedItemView(airfry: airFryData[0])
  .previewLayout(.sizeThatFits)
  .padding()

}
