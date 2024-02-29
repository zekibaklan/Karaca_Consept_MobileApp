//
//  NavigationBarView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI
import MapKit
struct NavigationBarView: View {
    @State private var isAnimated: Bool = false

    var numberOfProducts : Int
    // MARK: - BODY
    
    var body: some View {
     
      HStack {
        Button(action: {}, label: {
          Image(systemName: "location.north.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing)
            
           
            
            
          
            .font(.title)
            .foregroundColor(.black)
        }) //: BUTTON
        
        Spacer()
        
     LogoView()
          
          .opacity(isAnimated ? 1 : 0)
          .offset(x: 0, y: isAnimated ? 0 : -25)
          .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
              isAnimated.toggle()
            }
          })
     
         
        
        Spacer()
        
          NavigationLink(destination: SearchableView()) {
              ZStack {
                  Image(systemName: "magnifyingglass")
                      .font(.title)
                      .foregroundColor(.black)
              }
          }
          //: BUTTON
          
      } //: HSTACK
        
    }
    
}


#Preview {
    NavigationBarView(numberOfProducts: 1)
}
