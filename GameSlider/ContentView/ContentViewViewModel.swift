//
//  ContentViewViewModel.swift
//  GameSlider
//
//  Created by Никита Тыщенко on 01.05.2024.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var targetValue = Int.random(in: 0...100)
    @Published var currentValue = Double.random(in: 0...100)
    @Published var opacity = 0.5
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    func updateThumbOpacity() {
        opacity = CGFloat(computeScore()) / 100
    }
    
    func resetValue() {
        targetValue = Int.random(in: 0...100)
    }
}
