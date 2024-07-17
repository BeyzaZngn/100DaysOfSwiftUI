//
//  ContentView.swift
//  Day35ChallengeDay
//
//  Created by Beyza Zengin on 17.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var multiplication = 2
    @State private var question = 1
    
    var body: some View {
        
        VStack {
            
            Stepper("\(multiplication)", value: $multiplication, in: 2...12)
                .padding()
            
            Stepper("\(question)", value: $question)
                .padding()
               
            } .padding()
        }
       
    }


#Preview {
    ContentView()
}
