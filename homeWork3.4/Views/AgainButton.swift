//
//  AgainButton.swift
//  homeWork3.4
//
//  Created by Александра Мельникова on 08.08.2021.
//

import SwiftUI

struct AgainButton: View {
    
    @Binding var currentValue: Double
    @Binding var targetValue : Int
    
    var body: some View {
        Button(action: {
            targetValue = Int.random(in: 1...100)
            currentValue = 100
        }, label: {
            Text("Начать заново")
                .foregroundColor(.white)
        })
        .frame(width: 150, height: 40)
        .background(Color.blue)
        .cornerRadius(20)
        .animation(.easeInOut)
    }
}

struct AgainButton_Previews: PreviewProvider {
    static var previews: some View {
        AgainButton(currentValue: .constant(100),
                    targetValue: .constant(100))
    }
}
