//
//  AgeGroupButton.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation
import SwiftUI

// Custom view for the picker button
struct AgeGroupButton: View {
    @Binding var selectedAgeGroup: AgeGroup
    
    var body: some View {
        Menu {
            Picker("Choose Your Age Group", selection: $selectedAgeGroup) {
                Text("Kid").tag(AgeGroup.kid)
                Text("Teenager").tag(AgeGroup.teenager)
                Text("Adult").tag(AgeGroup.adult)
            }
        } label: {
            Text("Choose Your Age Group")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.fairgroundColor())
                .padding()
        }
    }
}
