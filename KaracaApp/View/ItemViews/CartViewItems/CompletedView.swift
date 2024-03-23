//
//  CompletedView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 28.02.2024.
//

import SwiftUI

struct CompletedView: View {
    // MARK: - PROPERTY
    
    
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Teşekkür ederiz!"
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ThemeBG")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .transition(.opacity)
                        .id(textTitle)
                        .padding()
                    Text("Siparişiniz başarıyla alındı.Müşteri temsilcilerimiz en kısa sürede siparişinizle ilgili detayları kontrol edecek ve işleme alacaklar. İlginiz ve güveniniz için teşekkür ederiz.")
                        .font(.title3)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                
                ZStack {
                    
                    Image(systemName: "checkmark.diamond")
                    
                        .resizable()
                        .frame(width: 250,height: 250)
                        .symbolEffect(.bounce.down.byLayer,value: isAnimating)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.green, .gray)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                    
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Güvenli Teslimat"
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Teşekkür ederiz!"
                                    }
                                }
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                } //: CENTER
                
                
                
                .padding(.horizontal)
                Spacer()
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
        
    }
}

#Preview {
    CompletedView()
}
