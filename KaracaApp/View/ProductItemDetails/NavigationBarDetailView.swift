//
//  NavigationBarDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct NavigationBarDetailView: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
      
    // MARK: - BODY
    
    var body: some View {
      HStack {
        Button(action: {
          withAnimation(.easeIn) {
            feedback.impactOccurred()
            shop.selectedProduct = nil
            shop.showingProduct = false
          }
        }, label: {
          Image(systemName: "chevron.left")
            .font(.title)
            .foregroundColor(.white)
        })
        
        Spacer()
        
        Button(action: {}, label: {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.white)
        })
      } //: HSTACK
    }
}

#Preview {
    NavigationBarDetailView()
        .environmentObject(Shop())
        .padding()
        .background(Color.gray)
}
