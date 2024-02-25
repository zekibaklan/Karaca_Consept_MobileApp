//
//  Constant.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 24.02.2024.
//

import Foundation
import SwiftUI

let columnSpacing: CGFloat = 10

let rowSpacing: CGFloat = 10

var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

let feedback = UIImpactFeedbackGenerator(style: .medium)
