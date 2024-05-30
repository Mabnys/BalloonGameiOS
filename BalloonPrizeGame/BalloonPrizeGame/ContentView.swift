//
//  ContentView.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 50) {
                Image("NYS_Fair")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Image("ITS_Logo")
                    .resizable()
                    .scaledToFit()
                NavigationLink(destination: EmptyView()) {
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
    }
}

#Preview {
    ContentView()
}
