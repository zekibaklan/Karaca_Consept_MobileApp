//
//  FactModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation
// MARK: - User Comment Model

struct userCommentModel: Identifiable {
    
  var id = UUID()
  var image: String
  var content: String
}
