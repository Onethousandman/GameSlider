//
//  GameSliderApp.swift
//  GameSlider
//
//  Created by Никита Тыщенко on 01.05.2024.
//

import SwiftUI

@main
struct GameSliderApp: App {
    @StateObject private var contentViewVM = ContentViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewVM)
        }
    }
}
