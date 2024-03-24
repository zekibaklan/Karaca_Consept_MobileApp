//
//  NavigationBarView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import MapKit
import SwiftUI

struct NavigationBarView: View {

 // MARK: - PROPERTIES
 @State private var isAnimated: Bool = false
 @State private var changeTheme: Bool = false
 @Environment(\.colorScheme) private var scheme
 @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
 @State private var isAnimating: Bool = false
 var numberOfProducts: Int

 // MARK: - BODY
 var body: some View {

  HStack {
   // MARK: - CHANGE THEME BUTTON
   Button(
    action: {
     changeTheme.toggle()
    },
    label: {

     Image(systemName: "circle.righthalf.filled.inverse")
      .resizable()
      .contentTransition(.symbolEffect(.replace))
      .frame(width: 20, height: 20)
      .padding(.trailing)
      .font(.title)
      .foregroundStyle(.foreground)

    })
   Spacer()
      
   // MARK: - LOGO VIEW
   LogoView()
    .opacity(isAnimated ? 1 : 0)
    .offset(x: 0, y: isAnimated ? 0 : -25)
    .onAppear(perform: {
     withAnimation(.easeOut(duration: 0.5)) {
      isAnimated = true
     }
    })
   Spacer()
      
   // MARK: - SEARCH BUTTON
   NavigationLink(destination: SearchableView()) {
    ZStack {
     Image(systemName: "magnifyingglass")
      .font(.title)
      .foregroundStyle(.foreground)

    }

   }

  }
  .preferredColorScheme(userTheme.colorScheme)
  .sheet(
   isPresented: $changeTheme,
   content: {
    ThemeChangeView(scheme: scheme)
     .presentationDetents([.height(410)])
     .presentationBackground(.clear)})
 }

}

#Preview {
 NavigationBarView(numberOfProducts: 1)
}

