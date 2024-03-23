//
//  KaracaView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI
import AuthenticationServices
import Firebase
import CryptoKit
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct KaracaView: View {
    
    @State private var errorMessage : String = ""
    @State private var showAlerts : Bool = false
    @State private var isActive : Bool = false
    @State private var isLoading : Bool = false
    @State private var nonce : String?
    @Environment(\.colorScheme) private var scheme
    // User log Status
    @AppStorage("log_status") var logStatus: Bool = false
    @StateObject var loginModel: LoginViewModel = .init()
    
    
    var body: some View {
        
        
        VStack {
            if !logStatus {
                ZStack(alignment : .bottom) {
                    Color("ThemeBG")
                        .ignoresSafeArea()
             
                        KaracaWelcomeView()
                 
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(MotionAnimationView().ignoresSafeArea())
                   
                    .mask {
                        Rectangle().fill(.linearGradient(
                            colors: [
                                .white,
                                .white,
                                .white,
                                .white,
                                .white.opacity(0.9),
                                .white.opacity(0.6),
                                .white.opacity(0.2),
                                .clear,
                                .clear,
                            
                            ],
                            startPoint: .top,
                            endPoint: .bottom))
                    }
                   
                    .ignoresSafeArea()
                    VStack(alignment: .leading) {
                
                         
                        
                        
                        VStack(alignment: .leading) {
                            Text("Karaca'ya Hoşgeldiniz!")
                                .font(.title.bold())
                            
                            // MARK: Custom Apple Sign in Button
                            
                            
                            SignInWithAppleButton { (request) in
                                loginModel.nonce = randomNonceString()
                                request.requestedScopes = [.email,.fullName]
                                request.nonce = sha256(loginModel.nonce)
                                
                            } onCompletion: { (result) in
                                switch result{
                                case .success(let user):
                                    print("success")
                                    guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                                        print("error with firebase")
                                        return
                                    }
                                    loginModel.appleAuthenticate(credential: credential)
                                case.failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                            .overlay {
                                ZStack {
                                    Capsule()
                                    
                                    HStack {
                                        Image(systemName: "applelogo")
                                        
                                        Text(" Apple ile Giriş Yap")
                                    }
                                    .foregroundStyle(scheme == .dark ? .black : .white)
                                }
                                .allowsHitTesting(false)
                            }
                            .signInWithAppleButtonStyle(scheme == .dark ? .white : .black)
                            .frame(height: 45)
                            .clipShape(.capsule)
                            .padding(.top,10)
                            
                            
                            Button(action: {
                                Task{
                                    do{
                                        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.rootController())
                                        
                                        loginModel.logGoogleUser(user: result.user)
                                        
                                    }catch{
                                        print(error.localizedDescription)
                                    }
                                }
                                
                            }, label: {
                                Image("googleLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28,height: 28)
                                Text("Google ile Giriş Yap")
                                    
                            })
                            .foregroundStyle(.primary)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .contentShape(.capsule)
                            .background(Capsule().stroke(Color.primary,lineWidth: 0.5))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        
                    }
                    
                }
            }
            else
            {
                AppView()
            }
            
        }
        .alert(loginModel.errorMessage, isPresented: $loginModel.showError) {
        }
    }
    
    
}
    #Preview {
        KaracaView()
            .environmentObject(Shop())
    }
