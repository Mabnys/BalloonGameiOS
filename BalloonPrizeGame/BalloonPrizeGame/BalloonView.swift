//
//  BalloonView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import SwiftUI
import Lottie

struct BalloonView: View {
    @State private var message = ""
    var body: some View {
        VStack {
            BalloonLottieView(lottieFile: "Balloon01")
        }
        .onTapGesture {
            let randomIndex = Int.random(in: 0...3)
            switch randomIndex {
            case 0:
                message = "You win a huge prize!!!"
            case 1:
                message = "You loose. Try again!!!"
            case 2:
                message = "You win a small prize"
            case 3:
                message = "You win a medium prize"
            
            default:
                break
            }
        }
    Text(message)
            .font(.title)
    }
}
