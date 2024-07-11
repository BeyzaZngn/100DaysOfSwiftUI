//
//  ContentView.swift
//  BetterRestMain
//
//  Created by Beyza Zengin on 10.07.2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var recommendedBedtime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp) { calculateBedtime() }
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)

                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .onChange(of: sleepAmount) { calculateBedtime() }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    /* Text("Daily coffee intake")
                        .font(.headline)
                     Otomatik olarak cup, cups a dönüşür(Markdown ile ilgiliymiş.)
                     Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    */
                    Section {
                        Picker("Daily coffee intake", selection: $coffeeAmount) {
                            ForEach(1..<21) {
                                Text("\($0) cup(s)")
                            }
                        }.font(.headline)
                        .pickerStyle(.menu)
                        .onChange(of: coffeeAmount) { calculateBedtime() }
                    }
                }
                
                VStack(alignment: .center) {
                    Text("Your ideal bedtime is…")
                        .font(.headline)
                    Text(recommendedBedtime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .navigationTitle("BetterRest")
            .onAppear(perform: calculateBedtime)
            
        }
    }
    
    func calculateBedtime() {
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            recommendedBedtime = sleepTime.formatted(date: .omitted, time: .shortened)

            
        } catch {
            
            recommendedBedtime = "Error calculating bedtime."

        }
        
    }
}

#Preview {
    ContentView()
}

// onChange, SwiftUI’da kullanıcı etkileşimlerini dinleyip bunlara tepki vermek için kullanılan güçlü bir araçtır.
// Bu fonksiyon, belirli bir değişkenin değerindeki değişiklikleri izleyerek belirli bir işlemi gerçekleştirmek için
// idealdir. Bu sayede kullanıcı arayüzünde daha dinamik ve reaktif deneyimler sunabilirsiniz.
