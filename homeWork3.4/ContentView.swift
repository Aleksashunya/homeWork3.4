//
//  ContentView.swift
//  homeWork3.4
//
//  Created by Александра Мельникова on 07.08.2021.
//
import SwiftUI

struct ContentView: View {
    
    @State private var currentValue: Double = 100
    @State private var targetValue = Int.random(in: 1...100)
    @State private var showAlert = false
    
    var body: some View {
        ZStack {                    //цвет фона и шрифтов прописываю потому что картинка
            Color(.white)           //имеет белый фон, и я хочу, чтобы для ночного режима
                                    // визуал не отличался от дневного
            VStack {
                Text("Насколько ты точен?")
                    .font(.title)
                    .foregroundColor(.black)
                
                Image("target")
                    .resizable()
                
                Text("Подвинь слайдер как можно ближе к:")
                    .foregroundColor(.black)
                
                ZStack(){
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 70,
                               height: 70)
                    
                    Text("\(targetValue)")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 30)
                
                GameSlider(currentValue: $currentValue,
                           targetValue: $targetValue)
                
                Spacer(minLength: 30)
                
                HStack(spacing: 20) {
                    CheckMeButton(currentValue: $currentValue,
                                  targetValue: $targetValue,
                                  showAlert: $showAlert)
                    
                    AgainButton(currentValue: $currentValue,
                                targetValue: $targetValue)
                }
                
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
