//
//  DishesView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct MenuView: View {
    
    // MARK: - BODY
    var body: some View {
        
        HStack(alignment: .center, spacing: 4) {
            // MARK: - 1ST COLUMN
            VStack(alignment: .leading, spacing: 4) {
                
                HStack {
                    Image(systemName: "star")
                    
                        .modifier(IconModifier())
                    Spacer()
                    Text("Çok Satan")
                }
                Divider()
                
                HStack {
                    Image(systemName: "wand.and.stars")
                        .modifier(IconModifier())
                    Spacer()
                    Text("Yeniler")
                }
                Divider()
                
                HStack {
                    Image(systemName: "surfboard")
                        .modifier(IconModifier())
                    Spacer()
                    Text("Sofra")
                }
                Divider()
                
                HStack {
                    Image(systemName: "fork.knife")
                        .modifier(IconModifier())
                    Spacer()
                    Text("Mutfak")
                }
            }
            
            // MARK: - 2ND COLUMN
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Divider()
                }
                
                Image(systemName: "menucard")
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }
            
            // MARK: - 3RD COLUMN
            VStack(alignment: .trailing, spacing: 4) {
                HStack {
                    Text("Aksesuar")
                    Spacer()
                    Image(systemName: "circlebadge.2")
                        .modifier(IconModifier())
                }
                Divider()
                
                HStack {
                    Text("Halı")
                    Spacer()
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                        .modifier(IconModifier())
                }
                Divider()
                
                HStack {
                    Text("İndirim")
                    Spacer()
                    Image(systemName: "heart.circle")
                        .modifier(IconModifier())
                }
                Divider()
                
                HStack {
                    Text("Hediye")
                    Spacer()
                    Image(systemName: "gift")
                        .modifier(IconModifier())
                }
            }
        }
        .font(.system(.callout, design: .serif))
        .foregroundColor(Color.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}
// MARK: - ICONMODIFIER
struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42, alignment: .center)
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewLayout(.fixed(width: 414, height: 280))
    }
}
