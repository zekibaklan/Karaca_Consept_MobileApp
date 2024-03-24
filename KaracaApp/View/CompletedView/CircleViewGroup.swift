//
//  CircleViewGroup.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 28.02.2024.
//

import SwiftUI

struct CircleViewGroup: View {
  // MARK: - PROPERTY
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 260, height: 260, alignment: .center)
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 260, height: 260, alignment: .center)
    } //: ZSTACK
    .blur(radius: isAnimating ? 0 : 10)
    .opacity(isAnimating ? 1 : 0)
    .scaleEffect(isAnimating ? 1 : 0.5)
    .animation(.easeOut(duration: 1), value: isAnimating)
    .onAppear(perform: {
      isAnimating = true
    })
  }
}

#Preview {
    ZStack {
        Color.brown
            .ignoresSafeArea(.all, edges: .all)
        CircleViewGroup(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
