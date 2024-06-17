//
//  Constants.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation

// Enum for age groups
enum AgeGroup: String, CaseIterable {
    case kid = "Kid"
    case teenager = "Teenager"
    case adult = "Adult"
   case none = ""
    var description: String {
        rawValue
    }
}
