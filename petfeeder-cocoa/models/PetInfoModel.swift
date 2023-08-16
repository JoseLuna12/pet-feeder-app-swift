//
//  PetInfoModel.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 13/6/23.
//

import Foundation

enum Weights {
    case grams
    case ounces
}

struct PetInfoModel {
    let name: String
    let dailyPortions: Int
    let weightPortions: Double
    let weight: Weights
}

class WeightValues {
    static func getWeightName(of weight: Weights) -> String {
        switch weight {
        case .grams:
            return "Grams"
        case .ounces:
            return "Ounces"
        }
    }
    
    static func getAbrebiation(from weight: Weights) -> String {
        switch weight {
        case .grams:
            return "g"
        case .ounces:
            return "oz"
        }
    }
}
