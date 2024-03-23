//
//  FactModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation
// MARK: - FACT MODEL

struct Fact: Identifiable {
    
  var id = UUID()
  var image: String
  var content: String
}
