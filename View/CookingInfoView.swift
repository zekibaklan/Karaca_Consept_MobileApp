//
//  CookingInfoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI

struct CookingInfoView: View {
    @State private var index = 1

    var body: some View {
        var screen = UIScreen.main.bounds
        ZStack {
            HStack(alignment : .center,spacing : 15)  {
                VStack(spacing: 2)  {
                Image(systemName: "stopwatch")
                    .font(.title2)
                Text("Pişirme süresi")
                Text("15 dk")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                }

                VStack(spacing: 2) {
                Image(systemName: "clock")
                    .font(.title2)
                Text("Pişirme derecesi")
                  
                Text("200°C")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                   
                
            }
            }
            .padding()
            
            .frame(minWidth : screen.width * 0.6,maxHeight : screen.height / 10,alignment: .center)
            .background(Color.white.opacity(0.7))
            
            .cornerRadius(15)
            .lineLimit(0)
           
           
        }
        .font(.footnote)
        .foregroundStyle(.black)
        .padding(.leading, index == 1 ? screen.width * -0.45 : screen.width * 0.45)
    }
}

#Preview {
    ZStack {
        Color.blue
            .edgesIgnoringSafeArea(.all)

        CookingInfoView()
    }
}
