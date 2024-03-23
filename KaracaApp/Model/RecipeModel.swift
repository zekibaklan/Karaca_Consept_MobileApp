//
//  CookingData.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 14.02.2024.
//

import Foundation

struct Recipe : Codable,Hashable,Identifiable {
    
    var id = UUID()
    let index : Int
    let cookingName : String
    let cookingTime : String
    let cookingDegrees : String
    let cookingImage : String
    let instructions : [String]
    let ingredients : [String]
    var isFavorite: Bool
}
