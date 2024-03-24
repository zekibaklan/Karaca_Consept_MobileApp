//
//  KaracaAppApp.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 6.01.2024.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseMessaging
import UserNotifications


@main
struct KaracaApp: App {
     // MARK: - PROPERTIES
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    

     // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            WellcomeView()
                .environmentObject(Shop())
                .preferredColorScheme(userTheme.colorScheme)
        }
    }
}
   // MARK: - APPDELEGATE
class AppDelegate: NSObject,UIApplicationDelegate{
    
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        FirebaseApp.configure()
        if let clientID = FirebaseApp.app()?.options.clientID{
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
        }
        // Setting Up Cloud Messaging...
        
        Messaging.messaging().delegate = self
        
        // Setting Up Notifications...
        
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

 

      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }
 
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }

}

 // MARK: - CLOUD MESSAGING
extension AppDelegate: MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

        let dataDict:[String: String] = ["token": fcmToken ?? ""]

        print(dataDict)
    }
}

 // MARK: - USER NOTIFICATION
extension AppDelegate : UNUserNotificationCenterDelegate {

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      _ = notification.request.content.userInfo
    completionHandler([[.banner,.badge, .sound]])
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    print(userInfo)

    completionHandler()
  }
}

