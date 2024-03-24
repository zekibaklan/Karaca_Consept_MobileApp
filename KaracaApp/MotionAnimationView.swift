//
//  MotionAnimationView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 7.03.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    
    @State private var randomCircle = Int.random(in: 12...20)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.8...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...1)
    }
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Image("karacalogo")
                        .foregroundColor(.gray)
                        .opacity(0.3)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .onAppear {
                            withAnimation(
                                Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        }
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY
    }
}
#Preview {
    WellcomeView()
    
}
