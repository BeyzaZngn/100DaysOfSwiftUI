//
//  ContentView.swift
//  Day25
//
//  Created by Beyza Zengin on 6.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["🪨 Rock", "📃 Paper", "✂️ Scissors"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showingScore = false
    @State private var finalScore = 0

    var body: some View {
        
        ZStack {
            
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.8, green: 0.7, blue: 0.45), location: 0.7),
                    .init(color: Color(red: 0.79, green: 0.40, blue: 0.44), location: 0.3),
                ], center: .top, startRadius: 600, endRadius: 350
            )
            .ignoresSafeArea()
            
            VStack {
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                
                Spacer(minLength: 5)
                
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                    .padding()
                
                Text("Round: \(round) of 10")
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                
                Spacer()
                Spacer()
                
                Text("App's move: \(moves[appChoice])")
                    .font(.largeTitle)
                    .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                if shouldWin {
                    Text("You should WIN")
                        .font(.title.weight(.bold))
                        .foregroundColor(.green)
                } else {
                    Text("You should LOSE")
                        .font(.title.weight(.bold))
                        .foregroundColor(.red)
                }
                
                Spacer()
                Spacer()
                
                HStack() {
                    Button("🪨 Rock") {
                        self.playerTapped(move: 0)
                    }
                        .buttonStyle(.borderedProminent)
                        .frame(width: 100, height: 50)
                        .tint(Color(red: 0.79, green: 0.40, blue: 0.44))
                        .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                  
                    
                    Button("📃 Paper") { 
                        self.playerTapped(move: 1)
                    }
                        .buttonStyle(.borderedProminent)
                        .frame(width: 100, height: 50)
                        .tint(Color(red: 0.79, green: 0.40, blue: 0.44))
                        .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
             
                    
                    Button("✂️ Scissors") {
                        self.playerTapped(move: 2)
                    }
                        .buttonStyle(.borderedProminent)
                        .frame(width: 120, height: 50)
                        .tint(Color(red: 0.79, green: 0.40, blue: 0.44))
                        .foregroundStyle(Color(red: 0.8, green: 0.7, blue: 0.45))
                   
                }.padding()
            }
            .padding(30)
        }
       
    .alert(isPresented: $showingScore) {
                Alert(title: Text("Game Over"), message: Text("Your final score is \(finalScore)"), dismissButton: .default(Text("OK")) {
                    self.resetGame()
                })
            }
    }
    
    func playerTapped(move: Int) {
        var pointChange = 0
        if shouldWin {
            if (appChoice == 0 && move == 1) || (appChoice == 1 && move == 2) || (appChoice == 2 && move == 0) {
                pointChange = 1
            } else {
                pointChange = -1
            }
        } else {
            if (appChoice == 0 && move == 2) || (appChoice == 1 && move == 0) || (appChoice == 2 && move == 1) {
                pointChange = 1
            } else {
                pointChange = -1
            }
        }
        score += pointChange
        
        if round < 10 {
            round += 1
            appChoice = Int.random(in: 0...2)
            shouldWin.toggle()
        } else {
            finalScore = score
            showingScore = true
        }
    }
    
    func resetGame() {
        score = 0
        round = 1
        appChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
