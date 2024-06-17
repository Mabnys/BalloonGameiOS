//
//  Constants.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation

// Enum for age groups
enum AgeGroup: String, CaseIterable {
    case kid = "Kid (1-11)"
    case teenager = "Teenager (12-18)"
    case adult = "Adult (18+)"
    
    var description: String {
        rawValue
    }
}
