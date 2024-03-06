//
//  OrderInfoView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import SwiftUI

struct OrderView: View {
    
        // MARK: - PROPERTIES
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
          ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
              
              
              Spacer(minLength: 10)
              
              Text("App Info")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
              
              AppInfoView()
              
              Text("Credits")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
              
              CreditsView()
              
              Spacer(minLength: 10)
              
              Button(action: {
                // ACTION
                // print("A button was tapped.")
                self.presentationMode.wrappedValue.dismiss()
              }) {
                Text("Continue".uppercased())
                      .font(.headline)
                      .padding()
                      .frame(minWidth: 0, maxWidth: .infinity)
                      .background(Capsule().fill(Color.pink))
                      .foregroundColor(Color.white)

              }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
          }
        }
    }


#Preview {
    OrderView()
}
