//
//  AgeGroupButton.swift
//  BalloonPrizeGame
//
//  Created by Mamadou Balde on 6/17/24.
//

import Foundation
import SwiftUI

// Custom view for age group buttons
struct AgeGroupButton: View {
    let ageGroup: AgeGroup
    @Binding var selectedAgeGroup: AgeGroup?
    
    var body: some View {
        Button(action: {
            selectedAgeGroup = ageGroup
        }) {
            Text(ageGroup.description)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(selectedAgeGroup == ageGroup ? .white : .blue)
                .padding()
                .background(selectedAgeGroup == ageGroup ? Color.blue : Color.clear)
                .cornerRadius(10)
        }
    }
}
