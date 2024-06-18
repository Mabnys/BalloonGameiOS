//
//  Constants.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation

// Enum for Game Type
enum GameType: String, CaseIterable {
    case easy = "Easy"
    case normal = "Normal"
   case none = ""
    var description: String {
        rawValue
    }
}
