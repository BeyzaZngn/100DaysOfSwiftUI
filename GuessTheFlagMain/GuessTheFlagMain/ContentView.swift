//
//  ContentView.swift
//  GuessTheFlagMain
//
//  Created by Beyza Zengin on 9.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotationAngle = 0.0
    @State private var selectedFlag: Int? = nil
    
    @State private var showingScore = false
    @State private var showingScoreAndTrueFlag = false
    
    @State private var tappedButton = 0
    @State private var tappedButtonState = false
    
    @State private var falseFlag = 0
    
    @State private var scoreTitle = ""
    
    @State private var userScore = 0
    
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK",
        "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400
            )
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            flagTapped(number)
                            withAnimation(.easeInOut(duration: 1)) {
                                selectedFlag = number
                                rotationAngle += 360
                            }
                        }) {
                            Image(countries[number])
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }.rotation3DEffect(
                            .degrees(selectedFlag == number ? rotationAngle : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .opacity(selectedFlag == nil || selectedFlag == number ? 1 : 0.25)
                        .scaleEffect(selectedFlag == nil || selectedFlag == number ? 1 : 0.8)
                        .animation(.easeInOut(duration: 1), value: selectedFlag)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }
                .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(userScore)")
            }
            .alert(scoreTitle, isPresented: $showingScoreAndTrueFlag) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(userScore)\n" + "Wrong! That's the flag of \(countries[falseFlag]) ")
            }
            .alert("Game Finished", isPresented: $tappedButtonState) {
                Button("Okey", action: resetGame)
            } message: {
                Text("Your final score is \(userScore)")
            }
        }
    }
        
        func flagTapped(_ number: Int) {
            tappedButton = tappedButton + 1
            
            if tappedButton >= 3 {
                tappedButtonState = true
            }
            
            
            if number == correctAnswer {
                scoreTitle = "Correct"
                userScore = userScore + 1
                showingScore = true
            }
            else {
                scoreTitle = "Wrong"
                userScore = userScore - 1
                
                falseFlag = number
                
                showingScoreAndTrueFlag = true
                if userScore < 0 {
                    userScore = 0
                }
            }
        }
        
        func resetGame() {
            tappedButton = 0
            userScore = 0
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            selectedFlag = nil
        }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            selectedFlag = nil
        }
}

#Preview {
    ContentView()
}
