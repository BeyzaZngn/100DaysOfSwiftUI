//
//  ContentView.swift
//  AnimationsSecondPart
//
//  Created by Beyza Zengin on 15.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    

    var body: some View {
        
        print(animationAmount)
        
       return VStack {
           
           Stepper("Scale amount", value: $animationAmount.animation(
               .easeInOut(duration: 1)
                   .repeatCount(3, autoreverses: true)
           ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
           
           Button("Tap Me") {
               withAnimation {
                   animationAmount += 360
               }
           }
           .padding(50)
           .background(.red)
           .foregroundStyle(.white)
           .clipShape(.circle)
           .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

           
           // Aşağıdaki gibi bir withAnimation() çağrısı kullanarak dönme
           // efektimizin bir yay animasyonu kullanmasını sağlayabiliriz:
         /*  withAnimation(.spring(duration: 1, bounce: 0.5)) {
               animationAmount += 360
           }
           */
           
           Button("Tap Me") {
               // do nothing
           }
           .background(.blue)
           .frame(width: 200, height: 200)
           .foregroundStyle(.white)
           
           // Sonuç, aşağıdaki gibi bir koddan farklı görünecektir:
           
           Button("Tap Me") {
               // do nothing
           }
           .frame(width: 200, height: 200)
           .background(.blue)
           .foregroundStyle(.white)
           
           
        }
    }
}
#Preview {
    ContentView()
}
