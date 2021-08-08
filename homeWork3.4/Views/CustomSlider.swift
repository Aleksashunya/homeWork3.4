//
//  CustomSlider.swift
//  homeWork3.4
//
//  Created by Александра Мельникова on 08.08.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor(red: 255,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(Double(computeScore())/100))
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.sliderMoved),
                         for: .valueChanged)
        
        return slider
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        DispatchQueue.main.async{
            currentValue = Double(uiView.value)
            uiView.thumbTintColor = UIColor(red: 255,
                                            green: 0,
                                            blue: 0,
                                            alpha: CGFloat(Double(computeScore())/100))
        }
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue,
                    targetValue: $targetValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Double
        @Binding var targetValue: Int
        
        init(currentValue: Binding<Double>,
             targetValue: Binding<Int>) {
            
            self._currentValue = currentValue
            self._targetValue = targetValue
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            currentValue = Double(sender.value)
            sender.thumbTintColor = UIColor(red: 255,
                                            green: 0,
                                            blue: 0,
                                            alpha: CGFloat(Double(computeScore())/100))
        }
        
        private func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue))
            return 100 - difference
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(currentValue: .constant(100),
                     targetValue: .constant(100))
    }
}
