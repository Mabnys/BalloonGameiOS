//
//  BalloonLottieView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import Lottie
import SwiftUI

struct BalloonLottieView: UIViewRepresentable {
    var lottieFile: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo:view.widthAnchor),
                                     animationView.heightAnchor.constraint(equalTo:view.heightAnchor)])
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
