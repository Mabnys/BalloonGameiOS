//
//  ContentView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        NavigationStack {
            VStack (spacing: 50) {
                Image("NYS_Fair")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Image("ITS_Logo")
                    .resizable()
                    .scaledToFit()
                NavigationLink(destination: BalloonView()) {
                    HStack {
                        Text("Start the balloon game")
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
            .padding()
        }
//        .onAppear {
//            startMusic()
//        }
//        .onDisappear {
//            stopMusic()
//        }
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
