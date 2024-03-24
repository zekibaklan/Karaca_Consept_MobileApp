//  CommentItemView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 15.03.2024.
//

import SwiftUI

struct CommentItemView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  @State private var name: String = ""
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  @State private var priority: String = "Yorum"
  let priorities = ["Öneri", "Yorum", "Şikayet"]

  // MARK: - BODY
  var body: some View {

    NavigationView {
      VStack {
        VStack(alignment: .leading, spacing: 20) {
          // MARK: - COMMENT PRIORITY
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .background(
            priority == "Öneri"
              ? Color.green : (priority == "Yorum" ? Color.yellow : Color.red).opacity(0.5)
          )
          .clipShape(.buttonBorder)
          .pickerStyle(SegmentedPickerStyle())
          // MARK: - COMMENT NAME

          TextField("Yorum Yaz", text: $name)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            .font(.system(size: 24, weight: .bold, design: .default))

          // MARK: - SAVE BUTTON
          Button(action: {
            if self.name != "" {
              let newFact = userCommentModel(image: "zeki", content: self.name)
              userCommentData.insert(newFact, at: 0)
              self.errorShowing = true
              self.errorTitle = "Teşekkürler!"
              self.errorMessage =
                "Yorumlarınız bizim için önemli.Bu değerli deneyimi bizimle paylaştığınız için çok teşekkür ederiz."
              self.name = ""

              return
            }

          }) {
            Text("Kaydet")
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)

              .background(Color.pink)
              .cornerRadius(9)
              .foregroundColor(Color.white)
          }  //: SAVE BUTTON
          .alert(isPresented: $errorShowing) {
            Alert(
              title: Text(errorTitle), message: Text(errorMessage),
              dismissButton: .default(Text("OK"))
            )
          }

        }

      }
    }
    .padding()
    .navigationViewStyle(StackNavigationViewStyle())

  }

}

#Preview {
  CommentItemView()
}
