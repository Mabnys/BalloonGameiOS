//
//  WinningAnimation.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import Foundation
import SwiftUI
import Lottie

struct WinningAnimation: View {
    // Binding to the prizeWon state variable
    @Binding var prizeWon: PrizeType
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all) // Semi-transparent black background
            VStack {
                BalloonLottieView(lottieFile: getAnimationFileName()) // Display the Lottie animation based on the prize won
                    .frame(height: 200)
                
                Text(getPrizeMessage()) // Display teh prize message
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    // Function to get the prize message based on the prize won
    func getPrizeMessage() -> String {
        switch prizeWon {
        case .none:
            return "You lose. Try again!"
        case .small:
            return "You win a small prize"
        case .medium:
            return "You win a medium prize"
        case .huge:
            return "You win a huge Prize"
        }
    }
    
    // Function to get the Lottie animation file name based on the prize won
    func getAnimationFileName() -> String {
        switch prizeWon {
        case .none:
            return "lose.json"
        case .small:
            return "small_prize.json"
        case .medium:
            return "medium_prize.json"
        case .huge:
            return "huge_prize.json"
        }
    }
}
