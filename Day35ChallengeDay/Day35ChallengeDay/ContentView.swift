//
//  ContentView.swift
//  Day35ChallengeDay
//
//  Created by Beyza Zengin on 17.07.2024.
//

import SwiftUI

struct ContentView: View {
    // Oyun ayarlarını kontrol etmek için kullanılan durumlar
    @State private var selectedTable = 2
    @State private var questionCount = 5
    @State private var isGameActive = false
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var correctAnswers = 0
    @State private var questions = [Question]()

    // Oyun Bitti Mi Durumu
    @State private var gameEnded = false
    
    var body: some View {
        VStack {
            if isGameActive {
                // Soru gösterim ekranı
                if !gameEnded {
                    GameView(question: questions[currentQuestionIndex],
                             userAnswer: $userAnswer,
                             submitAnswer: checkAnswer)
                } else {
                    // Oyun sonuç ekranı
                    VStack {
                        Text("Tebrikler! \(correctAnswers) doğru cevap verdiniz.")
                            .font(.title)
                            .padding()

                        Button("Tekrar Oyna") {
                            resetGame()
                        }
                        .padding()
                    }
                }
            } else {
                // Ayar ekranı
                SettingsView(selectedTable: $selectedTable, questionCount: $questionCount, startGame: startGame)
            }
        }
        .padding()
    }

    // Oyunu başlat
    func startGame() {
        generateQuestions()
        isGameActive = true
    }

    // Soruları oluştur
    func generateQuestions() {
        questions = []
        for _ in 1...questionCount {
            let multiplier = Int.random(in: 2...selectedTable)
            let multiplicand = Int.random(in: 2...12)
            let question = Question(text: "\(multiplier) x \(multiplicand)", answer: multiplier * multiplicand)
            questions.append(question)
        }
    }

    // Cevabı kontrol et
    func checkAnswer() {
        let answerInt = Int(userAnswer) ?? 0
        if answerInt == questions[currentQuestionIndex].answer {
            correctAnswers += 1
        }
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            userAnswer = ""
        } else {
            gameEnded = true
        }
    }
    
    // Oyunu sıfırla
    func resetGame() {
        isGameActive = false
        gameEnded = false
        correctAnswers = 0
        currentQuestionIndex = 0
        userAnswer = ""
    }
}

// Soru yapısı
struct Question {
    let text: String
    let answer: Int
}

// Oyun ekranı
struct GameView: View {
    let question: Question
    @Binding var userAnswer: String
    var submitAnswer: () -> Void

    var body: some View {
        VStack {
            Text(question.text)
                .font(.largeTitle)
                .padding()

            TextField("Cevabınızı girin", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Cevabı Gönder") {
                submitAnswer()
            }
            .padding()
        }
    }
}

// Ayar ekranı
struct SettingsView: View {
    @Binding var selectedTable: Int
    @Binding var questionCount: Int
    var startGame: () -> Void

    var body: some View {
        VStack {
            Text("Çarpım Tablosu Oyunu")
                .font(.title)
                .padding()

            Stepper("Çarpım Tablosu: \(selectedTable)", value: $selectedTable, in: 2...12)
                .padding()

            Text("Kaç soru sorulsun?")
            Picker("Soru Sayısı", selection: $questionCount) {
                Text("5").tag(5)
                Text("10").tag(10)
                Text("20").tag(20)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Oyuna Başla") {
                startGame()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
