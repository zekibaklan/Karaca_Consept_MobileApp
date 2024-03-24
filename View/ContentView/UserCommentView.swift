//
//  FactsView.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import SwiftUI

struct UserCommentView: View {

 // MARK: - PROPERTIES
 var userComment: userCommentModel

 // MARK: - BODY
 var body: some View {
  ZStack {
      
   // MARK: - COMMENT TEXT
   Text(userComment.content)
    .padding(.leading, 55)
    .padding(.trailing, 10)
    .padding(.vertical, 3)
    .frame(width: 300, height: 135, alignment: .center)
    .background(Color("ThemeBG"))
    .cornerRadius(12)
    .lineLimit(6)
    .multilineTextAlignment(.leading)
    .foregroundColor(Color.primary)
    .font(.system(.footnote, design: .serif))
    .fontWeight(.medium)
    .overlay(
     RoundedRectangle(cornerRadius: 12)
      .stroke(Color.gray, lineWidth: 1)
    )
   // MARK: - USER IMAGE
   Image(userComment.image)
    .resizable()
    .frame(width: 66, height: 66, alignment: .center)
    .clipShape(Circle())
    .background(
     Circle()
      .fill(Color("commentColor"))
      .frame(width: 74, height: 74, alignment: .center)
    )
    .background(
     Circle()
      .fill(Color("commentColor"))
      .frame(width: 82, height: 82, alignment: .center)
    )
    .background(
     Circle()
      .fill(.white)
      .frame(width: 90, height: 90, alignment: .center)
    )
    .offset(x: -150)
  }
 }
}
#Preview {
 UserCommentView(userComment: userCommentData[0])
}
