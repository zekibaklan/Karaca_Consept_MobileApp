//
//  ProfileView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import SwiftUI
import UserNotifications

struct ProfileView: View {
 // MARK: - PROPERTIES
 let items: [CoverFlowModel] = coverFlowItems
 @State private var selectedItem: CoverFlowModel?

 // MARK: - BODY
 var body: some View {
  NavigationStack {
   ZStack(alignment: .top) {
    Color("ThemeBG")
     .ignoresSafeArea()
    // MARK: - USERCARD DETAIL VIEW
    UserCardDetailView()
    VStack(alignment: .center) {

     Spacer()
     // MARK: - COVERFLOW ITEMS
     CoverFlowItem(
      itemWidth: 280,
      enableReflection: true,
      spacing: -65.60,
      rotation: 64.01,
      items: items
     ) { item in
      NavigationLink(destination: destinationView(for: item)) {
       RoundedRectangle(cornerRadius: 20)
        .fill(item.color.gradient)
        .overlay(
         VStack {
          Image(systemName: item.icon)
           .foregroundColor(.white)
           .font(.largeTitle)
           .padding(.top)
          Text(item.title)
           .foregroundColor(.white)
           .font(.largeTitle)
           .fontWeight(.bold)
         })
      }
     }
     .frame(height: 180)
     Spacer()

    }

   }

  }

 }
 // MARK: - DESTINATION VIEW
 func destinationView(for item: CoverFlowModel) -> some View {
  switch item.title {
  case "Siparişler":
   return AnyView(OrderView())
  case "Favori Ürünler":
   return AnyView(FavoriteItemView())
  case "Favori Tarifler":
   return AnyView(FavoriteRecipeView())
  case "Yorum Yaz":
   return AnyView(CommentView())
  case "Hakkında":
   return AnyView(AboutView())
  default:
   // Default destination view
   return AnyView(Text("Default Destination View"))
  }

 }

}

#Preview {
 ProfileView()
}
