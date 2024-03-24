//
//  SelectedIcon.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 17.03.2024.
//

import SwiftUI

struct SelectedIcon: View {
  // MARK: - PROPERTUES
  private let alternateAppIcons: [String] = [
    "karacaLogo1",
    "karacaLogo2",
    "karacaLogo3",
    "karacaLogo4",
    "karacaLogo5",
  ]

  // MARK: - BODY
  var body: some View {
    // MARK: - SECTION: ICONS

    List {
      Section(header: Text("Logo Seç")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                print("Icon \(alternateAppIcons[item]) was pressed.")

                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                  if error != nil {
                    print(
                      "Failed request to update the app's icon: \(String(describing: error?.localizedDescription))"
                    )
                  } else {
                    print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 60, height: 60)
                  .overlay(
                    RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.black, lineWidth: 1)
                  )
                  .cornerRadius(12)
              }
              .buttonStyle(.borderless)
            }
          }
        }  //: SCROLL VIEW
        .padding(.top, 12)

        Text("Yukarıdaki koleksiyondan favori uygulama logonuzu seçin.")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      }  //: SECTION
      .listRowSeparator(.hidden)
    }
  }
}

#Preview {
  SelectedIcon()
}
