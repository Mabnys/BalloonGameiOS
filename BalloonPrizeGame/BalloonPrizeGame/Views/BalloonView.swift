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
  @State var animationName: String = "Balloon01"
  
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
            showBallon.toggle()
            animationName = "Balloon01"
          }
      }
    }
  }
  
  func pickNumber() -> Int {
    let numbers = [
      0, 0, 0, 0, 0, 0,   // 0 appears 60% of the time
      1, 1, 1, 1,         // 1 appears 25% of the time
      2, 2,               // 2 appears 10% of the time
      3                   // 3 appears 5% of the time
    ]
    
    let randomIndex = Int(arc4random_uniform(UInt32(numbers.count)))
    return numbers[randomIndex]
  }
  
  // Function to determine the prize won
  func determinePrize() -> PrizeType {
    let randomValue = pickNumber() //Randomly choose a prize
    switch randomValue {
    case 0:
      return .none
    case 1:
      return .small
    case 2:
      return .medium
    case 3:
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
