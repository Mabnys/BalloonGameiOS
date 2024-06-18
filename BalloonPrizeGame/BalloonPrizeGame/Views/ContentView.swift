//
//  ContentView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
  @Environment(\.dismiss) var dismiss
  @State private var audioPlayer: AVAudioPlayer?
  @State private var selectedGameType: GameType = .none
  @State var showBallon = false
  @State var normalBalloon = false
  @State private var easyGameTypeBinding = false
  @State private var normalGameTypeBinding = false
  
  var body: some View {
    ZStack {
      VStack (spacing: 50) {
        Image("NYS_Fair")
          .resizable()
          .scaledToFit()
          .foregroundStyle(.tint)
        Image("ITS_Logo")
          .resizable()
          .scaledToFit()
        
        Spacer() // Adds spacing at the top
        
        // Buttons for selecting game type
        GameTypeButton(gameType: .easy, selectedGameType: $selectedGameType, showBallon: $showBallon, normalBalloon: $normalBalloon)
        GameTypeButton(gameType: .normal, selectedGameType: $selectedGameType, showBallon: $showBallon, normalBalloon: $normalBalloon)
        
        Spacer() // Adds spacing between the buttons and the navigation links
        
        // Navigation link to SecondView for "Easy" game type
        NavigationLink(destination: BalloonView(showBallon: $showBallon), isActive: $easyGameTypeBinding) {
        }
        
        // Navigation link to ThirdView for "Normal" game type
        NavigationLink(destination: NormalBalloonView(showBallon: $showBallon), isActive: $normalGameTypeBinding) {
        }
        
      }
      .padding()
      if showBallon {
        BalloonView(showBallon: $showBallon)
      } else if normalBalloon {
        NormalBalloonView(showBallon: $normalBalloon)
      }
    }
    .onAppear {
      startMusic()
    }
    .onDisappear {
      stopMusic()
    }
  }
  
  func startMusic() {
    DispatchQueue.global().async {
      if let soundURL = Bundle.main.url(forResource: "introSon", withExtension: "mp3") {
        do {
          audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
          audioPlayer?.prepareToPlay()
          audioPlayer?.numberOfLoops = -1
          audioPlayer?.play()
        } catch {
          print("Error loading audio file:", error.localizedDescription)
        }
      }
    }
  }
  
  func stopMusic() {
    audioPlayer?.stop()
  }
}

#Preview {
  ContentView()
}
