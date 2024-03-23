//
//  ProfileCardVİew.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 23.03.2024.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
      ZStack {
       
        // MARK: - 3. DEPTH
        
          Color.cardColor3
          .cornerRadius(40)
          .offset(y: 12)
        
        // MARK: - 2. LIGHT
        
          Color.cardColor4
          .cornerRadius(40)
          .offset(y: 3)
          .opacity(0.85)
        
        // MARK: - 1. SURFACE
        
        LinearGradient(
          colors: [
            .cardColor1,
            .cardColor1],
          startPoint: .leading,
          endPoint: .trailing
        )
        .cornerRadius(40)
      }
    
      .frame(width: 350, height: 180)
      .padding()
        
   
    }
  }


#Preview {
    ProfileView()
      
        .padding()
       
}
