//
//  NormalBalloonView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/18/24.
//

import Foundation
import SwiftUI
import Lottie

struct NormalBalloonView: View {
  // State variable to track if teh winning animation should be shown
  @State private var showWinningAnimation = false
  // State variable to track the prize won
  @State private var prizeWon: PrizeType = .none
  
  @State private var continueGame = false
  // @State  var animationName: [BalloonView]
  
  @State private var moveToTop = false
  
  // array of balloons
  @State private var balloons: [BalloonLottieView] = [BalloonLottieView(lottieFile: "Balloon2"), BalloonLottieView(lottieFile: "BlueBalloon"), BalloonLottieView(lottieFile: "GreenBalloon"), BalloonLottieView(lottieFile: "pink balloon"), BalloonLottieView(lottieFile: "GrayBalloon"), BalloonLottieView(lottieFile: "YellowBalloon")]
  
  @Binding var showBallon: Bool
  
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [.cyan, .black]),
        startPoint: .bottom,
        endPoint: .top
      )
      .edgesIgnoringSafeArea(.all) // Set the linear gradient as the background
      
      GeometryReader { geometry in
        VStack {
          Spacer()
          
          balloons[0]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 4, y: moveToTop ? 100 : geometry.size.height - 100)  // adjust the 'y' position
            .animation(Animation.linear(duration: 5), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
          balloons[1]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 2, y: moveToTop ? 100 : geometry.size.height - 80)  // adjust the 'y' position
            .animation(Animation.linear(duration: 3), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
          balloons[2]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 1.5, y: moveToTop ? 90 : geometry.size.height - 90)  // adjust the 'y' position
            .animation(Animation.linear(duration: 4), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
          balloons[3]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 4, y: moveToTop ? 70 : geometry.size.height - 70)  // adjust the 'y' position
            .animation(Animation.linear(duration: 4), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
          balloons[4]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 2, y: moveToTop ? 60 : geometry.size.height - 60)  // adjust the 'y' position
            .animation(Animation.linear(duration: 4), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
          balloons[5]
            .frame(width: 150, height: 150)
            .position(x: geometry.size.width / 1.5, y: moveToTop ? 50 : geometry.size.height - 50)  // adjust the 'y' position
            .animation(Animation.linear(duration: 4), value: moveToTop) // Slow aninmation
            .onTapGesture {
              prizeWon = determinePrize() // Determine the prize won
              showWinningAnimation = true
            }
        }
      }
      .onAppear {
        // Start the animation when the view appears
        withAnimation {
          moveToTop.toggle()
        }
      }
      
      // Show the winning animation if the state variable is true
      if showWinningAnimation {
        WinningAnimation(prizeWon: $prizeWon)
        
          .onTapGesture {
            showWinningAnimation = false
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
    let randomValue = pickNumber()
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
enum NormalPrizeType {
  case none, small, medium, huge
}
