//
//  AgeGroupButton.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation
import SwiftUI

struct GameTypeButton: View {
  let gameType: GameType
  @Binding var selectedGameType: GameType
  @Binding var showBallon: Bool
  @Binding var normalBalloon: Bool
  var body: some View {
    Button(action: {
      withAnimation {
        selectedGameType = gameType
        if selectedGameType == .easy {
          showBallon = true
          normalBalloon = false
          BalloonView(showBallon: $showBallon)
        } else {
          normalBalloon = true
          showBallon = false
          NormalBalloonView(showBallon: $normalBalloon)
        }
      }
    }) {
      
      HStack {
        Text(gameType.description)
          .font(.title)
          .fontWeight(.bold)
          .padding()
        Image(systemName: "arrowshape.forward.circle")
      }
      .frame(width: 280, height: 50, alignment: .center)
      .foregroundStyle(Color.white)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.fairgroundColor())
      )
      .padding()
      
    }
  }
}
