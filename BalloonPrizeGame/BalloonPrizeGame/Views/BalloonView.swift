//
//  BalloonView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import SwiftUI
import Lottie

struct BalloonView: View {
  // State variable to track if teh winning animation should be shown
  @State private var showWinningAnimation = false
  // State variable to track the prize won
  @State private var prizeWon: PrizeType = .none
  
  @State private var continueGame = false
  @State private var animationName: String = "Balloon01"
  
  @Binding var showBallon: Bool
  
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [.cyan, .black]),
        startPoint: .bottom,
        endPoint: .top
      )
      .edgesIgnoringSafeArea(.all) // Set the linear gradient as the background
      
      VStack {
        BalloonLottieView(lottieFile: animationName)
          .frame(maxWidth: .infinity, maxHeight: .infinity) // Set the height of the animation
          .onTapGesture {
            // Handle balloon tap
            prizeWon = determinePrize() // Determine the prize won
            showWinningAnimation = true //Show teh winning animation
          }
      }
      .ignoresSafeArea()
      
      // Show the winning animation if the state variable is true
      if showWinningAnimation {
        WinningAnimation(prizeWon: $prizeWon)
          .onTapGesture {
            showWinningAnimation = false
            animationName = "Balloon01"
          }
      }
    }
  }
  
  // Function to determine the prize won
  func determinePrize() -> PrizeType {
    let randomValue = Int.random(in: 0...3) // Randomly choose a prize
    switch randomValue {
    case 0:
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        showBallon.toggle()
      }
      return .none
    case 1:
      continueGame.toggle()
      return .small
    case 2:
      continueGame.toggle()
      return .medium
    case 3:
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        showBallon.toggle()
      }
      return .huge
    default:
      return .none
    }
  }
}

// Enum to represent the different prize types
enum PrizeType {
  case none, small, medium, huge
}
