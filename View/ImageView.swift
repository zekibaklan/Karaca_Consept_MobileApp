//
//  CardView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI


struct ImageView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("patates")
                .resizable()
                .scaledToFit()
                .clipShape(RightBottomCornerShape(cornerRadius: 50))
                           
                   
                 
            
            Spacer()
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

struct RightBottomCornerShape: Shape {
    var cornerRadius: CGFloat = .zero

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

