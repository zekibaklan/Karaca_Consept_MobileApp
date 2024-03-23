//
//  ProfileView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI
import UserNotifications


struct ProfileView: View {
    let items: [CoverFlowModel] = coverFlowItems
    @State private var selectedItem: CoverFlowModel?
    let user = Auth.auth().currentUser
    @AppStorage("log_status") var logStatus: Bool = false
    
    @State private var isOn = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment : .top) {
                Color("ThemeBG")
                    .ignoresSafeArea()
                ProfileCardView()
                
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Hoşgeldin, \(user?.displayName ?? "Zeki Baklan")")
                            .fontWeight(.black)
                            .font(.system(size: 18))
                        Spacer()
                        WebImage(url: user?.photoURL ?? URL(string: "https://picsum.photos/200/300?grayscale"))
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(.circle)
                            .background(
                                Circle()
                                    .fill(.cardColor3)
                                    .frame(width: 65, height: 65, alignment: .center))
                            .shadow(color: .black.opacity(0.25), radius: 4)
                        
                    }
                    
                    Text("\(user?.email ?? "zekibaklan") ile giriş yaptınız.")
                        .font(.caption)
                    
                    
                    
                    
                    HStack() {
                        Text("Bildirimler")
                        Toggle(isOn: $isOn) {
                            
                            Text(isOn ? "Açık" : "Kapalı")
                            
                        }
                        .toggleStyle(.button)
                        .onChange(of: isOn) {
                            if isOn {
                sendNotification(notification: "Açık")
                            }
                            else {
                                sendNotification(notification: "Kapalı")
                            }
                        }
                        Spacer()
                        Button(action: {
                            
                            try? Auth.auth().signOut()
                            logStatus = false
                            
                        }, label: {
                            Text("Çıkış Yap")
                                .font(.headline)
                                .padding(.horizontal, 10) // Yatay iç boşluğu azalttık
                                .padding(.vertical, 10)
                            
                            
                        })
                        .clipShape(.capsule)
                        .background(
                            Capsule()
                                .foregroundStyle(.cardColor3))
                        
                        
                        
                    }
                    .padding(.top,30)
                    
                    
                    
                }
                .foregroundStyle(.white)
                
                .padding(.horizontal,40)
                .padding(.top,35)
                VStack(alignment : .center) {
                    
                    
                    Spacer()
                    
                    
                    CoverFlowItem(
                        itemWidth: 280,
                        enableReflection: true,
                        spacing: -65.60,
                        rotation: 64.01,
                        items: items
                    ) { item in
                        NavigationLink(destination: destinationView(for: item)) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(item.color.gradient)
                                .overlay(
                                    VStack {
                                        Image(systemName: item.icon)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .padding(.top)
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                    }
                                )
                        }
                        
                    }
                    
                    .frame(height: 180)
                    Spacer()
                    
                }
                
            }
            
            
            
        }
        
        
        
    }
    
    func destinationView(for item: CoverFlowModel) -> some View {
        switch item.title {
        case "Siparişler":
            return AnyView(OrderView())
        case "Favori Ürünler":
            return AnyView(FavoriteItemView())
        case "Favori Tarifler":
            return AnyView(FavoriteRecipeView())
        case "Yorum Yaz":
            return AnyView(CommentView())
        case "Hakkında":
            return AnyView(AboutView())
        default:
            // Default destination view
            return AnyView(Text("Default Destination View"))
        }
        
    }
    func sendNotification(notification: String) {
        // Bildirim içeriğini oluştur
        let content = UNMutableNotificationContent()
        content.title = "Bildirim Durumu"
        content.body = "Bildirimler \(notification)"
     
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // Bildirimin gönderilmesi gereken bir request oluştur
        let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)
        
        // Bildirimi programlayıcıya ekle
        UNUserNotificationCenter.current().add(request)
    }
}


#Preview {
    ProfileView()
}
