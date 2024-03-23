//
//  CoverFlowModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 5.03.2024.
//

import Foundation
import SwiftUI


struct CoverFlowModel : Identifiable {
    let id : UUID = .init()
    var title : String
    var icon : String
    var color : Color
}
