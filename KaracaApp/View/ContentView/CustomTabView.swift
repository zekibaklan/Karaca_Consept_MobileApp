//
//  CustomTabView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 1.03.2024.
//

import SwiftUI

// MARK: - TAB INFO
enum Tab: String, CaseIterable {

 case house
 case map
 case cart
 case leaf
 case person
}

// MARK: - PROPERTIES
struct CustomTabView: View {
 @Binding var selectedTab: Tab
 private var fillImage: String {
  selectedTab.rawValue + ".fill"
 }
 private var tabColor: Color {
  switch selectedTab {
  case .house:
   return .blue
  case .map:
   return .indigo
  case .cart:
   return .purple
  case .leaf:
   return .green
  case .person:
   return .orange
  }
 }

 // MARK: - BODY
 var body: some View {
  VStack {
   HStack {
    ForEach(Tab.allCases, id: \.rawValue) { tab in
     Spacer()
     Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
      .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
      .foregroundColor(tab == selectedTab ? tabColor : .gray)
      .font(.system(size: 20))
      .onTapGesture {
       withAnimation(.easeInOut(duration: 0.1)) {
        selectedTab = tab
       }
      }
     Spacer()
    }
   }
   .frame(width: nil, height: 60)
   .background(.thinMaterial)
   .cornerRadius(20)
   .padding()
  }
 }
}

#Preview {
 CustomTabView(selectedTab: .constant(.house))
}
