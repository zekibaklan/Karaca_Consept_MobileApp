//
//  AboutView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 16.03.2024.
//

import SwiftUI

struct AboutView: View {
    // MARK: - BODY
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      NavigationView {
          ZStack {
              
              VStack(alignment: .center, spacing: 0) {
              // MARK: - FORM
              
              Form {
              
                SelectedIcon()
                    
                
                // MARK: - SECTION 3
                
                Section(header: Text("daha fazlası için")) {
                  FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://zekibaklan.com")
                    FormRowLinkView(icon: "link", color: Color.black, text: "X", link: "https://twitter.com/byakuya25493155")
                  FormRowLinkView(icon: "play.rectangle", color: Color.red, text: "Youtube", link: "https://www.youtube.com/channel/UC_nKHErxJsD1nYT8l9uc27g")
                    FormRowLinkView(icon: "g.circle", color: .brown, text: "GitHub", link: "https://github.com/zekibaklan")
                    FormRowLinkView(icon: "l.circle", color: .blue, text: "LinkedIn", link: "https://www.linkedin.com/in/zekibaklan/")
                    FormRowLinkView(icon: "s.square", color: .cyan, text: "StackOverflow", link: "https://stackoverflow.com/users/20239366/zeki-baklan")
                } //: SECTION 3
                  .padding(.vertical, 3)
                
                // MARK: - SECTION 4
                
                Section(header: Text("uygulama hakkında")) {
                  FormRowStaticView(icon: "gear", firstText: "Uygulama", secondText: "Karaca ConseptUI")
                  FormRowStaticView(icon: "checkmark.seal", firstText: "Uyumluluk", secondText: "iPhone, iPad")
                  FormRowStaticView(icon: "keyboard", firstText: "Geliştirici", secondText: "Zeki Baklan")
              
                  FormRowStaticView(icon: "flag", firstText: "Versiyon", secondText: "1.0")
                } //: SECTION 4
                  
                  .padding(.vertical, 3)
              } //: FORM
         
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
              }
          
          } //: VSTACK
        
          .scrollContentBackground(.hidden)
          .background(Color("ThemeBG"))
      } //: NAVIGATION
      .accentColor(.pink)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
    
  }



#Preview {
    AboutView()
}
