//
//  SliderView.swift
//  GameSlider
//
//  Created by Никита Тыщенко on 01.05.2024.
//

import SwiftUI

struct SliderView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    
    var body: some View {
        HStack {
            Text("0")
            SliderRepresentation(action: contentViewVM.updateThumbOpacity)
            Text("100")
        }
    }
}

#Preview {
    SliderView()
        .environmentObject(ContentViewViewModel())
}
