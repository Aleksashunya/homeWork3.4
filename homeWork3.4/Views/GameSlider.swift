//
//  GameSlider.swift
//  homeWork3.4
//
//  Created by Александра Мельникова on 07.08.2021.
//

import SwiftUI

struct GameSlider: View {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.black)
            
            CustomSlider(currentValue: $currentValue,
                         targetValue: $targetValue)
            
            Text("100")
                .foregroundColor(.black)
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(100),
                   targetValue: .constant(100))
    }
}
