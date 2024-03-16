//
//  ProfileView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import SwiftUI

struct ProfileView: View {
    let items: [CoverFlowModel] = coverFlowItems
    @State private var selectedItem: CoverFlowModel?

    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 0)
                CoverFlowItem(
                    itemWidth: 280,
                    enableReflection: true,
                    spacing: -103.60,
                    rotation: 84.01,
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
                                }
                            )
                    }
                 
                }
                .frame(height: 180)
                Spacer(minLength: 0)
                
            }
            
            .background(MotionAnimationView().ignoresSafeArea())
            
        }
       
    }

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
        default:
            // Default destination view
            return AnyView(Text("Default Destination View"))
        }
        
    }
    
}


#Preview {
    ProfileView()
}
