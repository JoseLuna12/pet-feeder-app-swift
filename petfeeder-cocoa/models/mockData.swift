//
//  mockData.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 25/5/23.
//

import Foundation

class MockData {
    
    static func getPets() -> [Pet]{
        return [
        Pet(name: "Lucas", singlePortion: 30, dailyPortion: 2),
        Pet(name: "Pavo", singlePortion: 50, dailyPortion: 2),
        Pet(name: "Darla", singlePortion: 50, dailyPortion: 2),
        Pet(name: "Gunter", singlePortion: 50, dailyPortion: 2),
        ]
    }
    
    static func getPetsInfo() -> [PetInfoModel] {
        return [
            PetInfoModel(name: "Lucas", dailyPortions: 2, weightPortions: 50, weight: .grams),
            PetInfoModel(name: "Pavo", dailyPortions: 2, weightPortions: 50, weight: .grams),
            PetInfoModel(name: "Darla", dailyPortions: 2, weightPortions: 50, weight: .grams),
        ]
    }
    
    
    
}
