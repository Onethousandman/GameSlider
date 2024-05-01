//
//  ContentView.swift
//  GameSlider
//
//  Created by Никита Тыщенко on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(contentViewVM.targetValue)")
            
            SliderView()
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(contentViewVM.computeScore())")
            }
            
            Button("Начать заново") {
                contentViewVM.resetValue()
                contentViewVM.updateThumbOpacity()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
}
