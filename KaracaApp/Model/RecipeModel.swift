//
//  CookingData.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 14.02.2024.
//

import Foundation

struct Recipe : Identifiable {
    
    var id = UUID().uuidString
    let index : Int
    let cookingName : String
    let cookingTime : String
    let cookingDegrees : String
    let cookingImage : String
    let instructions : [String]
    let ingredients : [String]
    
}
