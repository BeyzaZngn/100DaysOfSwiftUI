//
//  ContentView.swift
//  Day19ChallengeDay
//
//  Created by Beyza Zengin on 7.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var baseValue = 0.0
    @State private var lengthOptions = ["Metres", "Kilometres"]
    @State private var outputValue = 0.0
    @State private var sourceUnit = "Metres"
    @State private var outputUnit = "Kilometres"
    @FocusState private var focusedKeyboard: Bool
    
    
    var convertedValue : String {
        
        var forOutputValue = 0.0
        
        if sourceUnit==outputUnit{
            forOutputValue = baseValue
        }
        if sourceUnit=="Metres" && outputUnit=="Kilometres"{
            forOutputValue = baseValue/1000
            
        }
        if sourceUnit=="Metres" && outputUnit=="Foot"{
            forOutputValue = baseValue*3.281
            
        }
        if sourceUnit=="Metres" && outputUnit=="Yards"{
            forOutputValue = baseValue*1.094
            
        }
        if sourceUnit=="Kilometres" && outputUnit=="Metres"{
            forOutputValue = baseValue*1000
            
        }
        if sourceUnit=="Kilometres" && outputUnit=="Foot"{
            forOutputValue = baseValue*3281
            
        }
        if sourceUnit=="Kilometres" && outputUnit=="Yards"{
            forOutputValue = baseValue*1094
        }
        
        let totalText: String =  String(format: "%.2f", forOutputValue)
        return totalText
    }


    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section{
                    TextField("Type value here", value: $baseValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focusedKeyboard)
                } header: {
                    Text("Type value here")
                }
                
                Section {
                    Picker("Choose source unit", selection: $sourceUnit){
                        ForEach (lengthOptions, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Source Unit: ")
                }
                
                Section {
                    Picker("Choose output unit", selection: $outputUnit){
                        ForEach (lengthOptions, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Output Unit: ")
                }
                Section{
                    Text("\(convertedValue)")
                }
                header : {
                    Text("Value from \(sourceUnit) to \(outputUnit)")
                }
                
                
            }.navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
