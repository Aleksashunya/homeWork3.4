//
//  CheckMeButton.swift
//  homeWork3.4
//
//  Created by Александра Мельникова on 08.08.2021.
//

import SwiftUI

struct CheckMeButton: View {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(action: {
            showAlert = true
        }, label: {
            Text("Проверь меня")
                .accentColor(.white)
        })
        .alert(isPresented: $showAlert,
               content: {
                Alert(title: Text("Твой результат"),
                      message: lround(currentValue) != targetValue ? Text("\(lround(currentValue))") : Text("Поздравляю! Ты самый точный"),
                      dismissButton: .cancel(Text("OK")))
               }
        )
        .frame(width: 150, height: 40)
        .background(Color.blue)
        .cornerRadius(20)
        .animation(.easeInOut)
    }
}

struct CheckMeButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckMeButton(currentValue: .constant(100),
                      targetValue: .constant(100),
                      showAlert: .constant(false))
    }
}
