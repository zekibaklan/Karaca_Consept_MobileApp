//
//  KaracaView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct KaracaView: View {
    
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        
    
        VStack {
            Spacer()
            Image("karacawallpaper")
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
            .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
            .opacity(self.pulsateAnimation ? 1 : 0.9)
            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)

            .onAppear(perform: {
              self.pulsateAnimation.toggle()
            })
        
      
          Text("Air Pro Cook Mobil Uygulaması ile lezzetleri keşfet, tarifini paylaş!")
            .lineLimit(nil)
            .font(.system(.headline, design: .serif))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineSpacing(8)
            .frame(maxWidth: 640, minHeight: 40)
            
            Text("Tarif videonu çek, Instagram Reels'a yükle, herkesle paylaş!")
              .lineLimit(nil)
              .font(.system(.footnote, design: .serif))
              .foregroundColor(.black)
              .multilineTextAlignment(.center)
              .lineSpacing(8)
              .frame(maxWidth: 640, minHeight: 60)
            
            Spacer()
            
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
        
       
                  
            
        
    }
    
}

#Preview {
    
        KaracaView()
        
       
    
        
      
}
