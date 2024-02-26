//
//  LogoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
      HStack(spacing: 4) {
        
        
        Image("karacalogo")
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30, alignment: .center)
        
        
      } //: HSTACK
    }
}

#Preview {
    LogoView()
}
