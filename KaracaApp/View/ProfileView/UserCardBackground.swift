//
//  ProfileCardVİew.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 23.03.2024.
//

import SwiftUI

struct UserCardBackground: View {
    var body: some View {
      ZStack {
       
    
        
          Color.cardColor3
          .cornerRadius(40)
          .offset(y: 12)
        
   
        
          Color.cardColor4
          .cornerRadius(40)
          .offset(y: 3)
          .opacity(0.85)
        
    
        
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
    UserCardBackground()
      
        .padding()
       
}
