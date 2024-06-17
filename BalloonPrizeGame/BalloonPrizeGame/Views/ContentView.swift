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
  // State variable to store the selected age group
  @State private var selectedAgeGroup: AgeGroup = .none
  
  @State private var showBallon = false
  @State private var selectAgeGroupBinding = false
  
  var body: some View {
    ZStack {
      VStack (spacing: 50) {
        Image("NYS_Fair")
          .imageScale(.large)
          .foregroundStyle(.tint)
        Image("ITS_Logo")
          .resizable()
          .scaledToFit()
 
        
        // Picker button for selecting age group
        AgeGroupButton(selectedAgeGroup: $selectedAgeGroup).opacity(selectedAgeGroup == .none ? 1 : 0)
          .onChange(of: showBallon) { oldValue, newValue in
            if newValue == false {
              selectedAgeGroup = .none
            }
          }
        
        if selectedAgeGroup != .none {
          Button {
            showBallon = true
          } label: {
            HStack {
                Text("\(selectedAgeGroup.description) is starting the balloon game")
                Image(systemName: "arrowshape.forward.circle")
            }
            .frame(width: 280, height: 50, alignment: .center)
            .foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fairgroundColor())
            )
          }
          
        }
      }
      .padding()
      if showBallon {
        BalloonView(showBallon: $showBallon)
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
