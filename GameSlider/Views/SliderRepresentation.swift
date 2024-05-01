//
//  SliderRepresentation.swift
//  GameSlider
//
//  Created by Никита Тыщенко on 01.05.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel

    let action: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )

        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(contentViewVM.currentValue)
        uiView.thumbTintColor = .red.withAlphaComponent(contentViewVM.opacity)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $contentViewVM.currentValue, action: action)
    }
}

extension SliderRepresentation{
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        let action: () -> Void
                
        init(currentValue: Binding<Double>, action: @escaping () -> Void) {
            self._currentValue = currentValue
            self.action = action
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
            action()
        }
    }
}

#Preview {
    SliderRepresentation() {}
        .environmentObject(ContentViewViewModel())
}
