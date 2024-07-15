//
//  ContentView.swift
//  Animations
//
//  Created by Beyza Zengin on 13.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                // animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay( //Kaplamalar, kapladığımız görünümle aynı boyutta ve konumda
                //yeni görünümler oluşturmamızı sağlayan bir overlay() değiştiricisi
                //kullanılarak oluşturulur.
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

/*

 Bu repeatForever() animasyonlarını onAppear() ile birlikte kullanarak hemen
 başlayan ve görünümün ömrü boyunca devam eden animasyonlar oluşturabiliriz.
 (Kalp atışı gibi)
 .animation(
     .easeInOut(duration: 1)
         .repeatForever(autoreverses: true),
     value: animationAmount
 )
 
*/

