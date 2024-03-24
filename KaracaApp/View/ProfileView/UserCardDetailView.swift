//
//  userCardDetailView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.03.2024.
//

import FirebaseAuth
import SDWebImageSwiftUI
import SwiftUI

struct UserCardDetailView: View {
  // MARK: - PROPERTIES
  let user = Auth.auth().currentUser
  @AppStorage("log_status") var logStatus: Bool = false
  @State private var isOn = false

  // MARK: - BODY
  var body: some View {

    ZStack(alignment: .top) {
      // MARK: - USERCARD BACKGROUND
      UserCardBackground()

      // MARK: - USERDETAIL VIEW
      VStack(alignment: .leading) {
        HStack {

          // MARK: - WELLCOME TEXT
          Text("Hoşgeldin, \(user?.displayName ?? "Zeki Baklan")")
            .fontWeight(.black)
            .font(.system(size: 18))
          Spacer()

          // MARK: - CARD IMAGE
          WebImage(url: user?.photoURL ?? URL(string: "https://picsum.photos/200/300?grayscale"))
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(.circle)
            .background(
              Circle()
                .fill(.cardColor3)
                .frame(width: 65, height: 65, alignment: .center)
            )
            .shadow(color: .black.opacity(0.25), radius: 4)
        }

        // MARK: - CARD EMAIL
        Text("\(user?.email ?? "zekibaklan") ile giriş yaptınız.")
          .font(.caption)

        // MARK: - NOTIFICATION
        HStack {
          Text("Bildirimler")
          Toggle(isOn: $isOn) {
            Text(isOn ? "Açık" : "Kapalı")
          }
          .toggleStyle(.button)
          .onChange(of: isOn) {
            if isOn {
              sendNotification(notification: "Açık")
            } else {
              sendNotification(notification: "Kapalı")
            }
          }
          Spacer()

          // MARK: - QUIT BUTTON
          Button(
            action: {

              try? Auth.auth().signOut()
              logStatus = false

            },
            label: {
              Text("Çıkış Yap")
                .font(.headline)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)

            }
          )
          .clipShape(.capsule)
          .background(
            Capsule()
              .foregroundStyle(.cardColor3))

        }
        .padding(.top, 30)

      }
      .foregroundStyle(.white)

      .padding(.horizontal, 40)
      .padding(.top, 35)
    }
  }
  // MARK: - NOTIFICATION FUNCTION
  func sendNotification(notification: String) {
    // Bildirim içeriğini oluştur
    let content = UNMutableNotificationContent()
    content.title = "Bildirim Durumu"
    content.body = "Bildirimler \(notification)"

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

    // Bildirimin gönderilmesi gereken bir request oluştur
    let request = UNNotificationRequest(
      identifier: "testNotification", content: content, trigger: trigger)

    // Bildirimi programlayıcıya ekle
    UNUserNotificationCenter.current().add(request)
  }
}
#Preview {
  UserCardDetailView()
}
