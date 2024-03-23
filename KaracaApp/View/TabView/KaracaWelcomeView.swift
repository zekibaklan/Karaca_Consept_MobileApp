//
//  karacaWelcomeImage.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 21.03.2024.
//

import SwiftUI

struct KaracaWelcomeView: View {
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        Image("karacawallpaper")
            .resizable()
            .frame(width: 280,height: 280)
            .aspectRatio(contentMode: .fit)  
            .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
            .opacity(self.pulsateAnimation ? 1 : 0.9)
            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)
        
            .onAppear(perform: {
                self.pulsateAnimation.toggle()
            })
    }
}

#Preview {
    KaracaWelcomeView()
}
