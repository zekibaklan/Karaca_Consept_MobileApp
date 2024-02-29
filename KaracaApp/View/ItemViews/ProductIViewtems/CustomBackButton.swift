//
//  NavigationBarDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 26.02.2024.
//

import SwiftUI

struct CustomBackButton: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var shop: Shop
    @State private var isCardViewPresented = false
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
        
       
       
        
      } //: HSTACK
    }
}

#Preview {
    CustomBackButton()
        .environmentObject(Shop())
        .padding()
        .background(Color.gray)
}
