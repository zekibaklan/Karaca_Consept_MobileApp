//
//  CardView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI


struct ImageView: View {
    @State var materials : Array = ["750 gr patates","1 kaşık yağ","1/2 çay kaşığı tuz"]
    @State var descriptions : Array  = ["Patatesleri iyice yıkadıktan sonra elma dilimi şeklinde kesin.","Daha çıtır olması için soğuk su dolu bir kaba alıp 15 dakika bekletin.","Patatesleri sudan çıkartıp iyice kuruladıktan sonra derin bir kapta zeytinyağı, tuz ve karabiberle harmanlayın."]
    
    
    @State var screen = UIScreen.main.bounds
    @State var indexNumber : Int = 1
    var body: some View {

        VStack(alignment: .center,spacing: 0) {
            ZStack {
                Image("patates")
                    .resizable()
                    .scaledToFit()
                    .clipShape(CornerShape(cornerRadius: 75, isLeft: indexNumber % 2 == 0))
                
                CookingInfoView()
                    .offset(y: screen.width / 5)
            }
            
            
            
            Text("PARMAK PATATES")
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundStyle(.brown)
                .padding(.top,20)
               
        
            
            Rectangle()
                .frame(width: 360,height: 1)
                .padding(.top,20)
            
            VStack(alignment : .leading,spacing: 12) {
                ForEach(materials,id: \.self) { material in
                    
                    HStack(alignment : .center,spacing : 5) {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 10, height: 10)
                            .font(.callout)
                        Text(material)
                            .font(.footnote)
                    }
                    
                }
            }
            .padding(.top,20)
            
            
            Rectangle()
                .frame(width: 360,height: 1)
                .padding(.top,20)
            Spacer()
            Text("YAPILIŞ")
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundStyle(.brown)
               
            
            VStack(alignment : .leading) {
                ForEach(descriptions , id: \.self) { description in
                      
                    HStack(spacing : 5) {
                        Circle()
                     
                          .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(.black)
                            .font(.callout)
                            
                        
                        Text(description)
                            .baselineOffset(5)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            
                    }
                   
                   
                }
                
                .padding(.vertical, 8)
           
                Spacer()
                Text("Bu tarifi Air Pro Cool Manuel’de, tarifte belirtilen pişirme sıcaklığını ve pişirme süresini ayarlayarak hazırlayabilirsiniz.")
                    .font(.system(size: 10, weight: .light, design: .rounded))
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
       
       
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            ImageView()
               
                
        }
           
    }
}

struct CornerShape: Shape {
    var cornerRadius: CGFloat = .zero
    var isLeft: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()
        if isLeft {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        path.closeSubpath()
        return path
    }
}



