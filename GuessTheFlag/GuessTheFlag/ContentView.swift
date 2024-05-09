//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Beyza Zengin on 8.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        
        
        VStack {
            
                Button("Button 1", systemImage: "pencil.and.ruler.fill") { }
                    .buttonStyle(.bordered)
    
            Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
            
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
            
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.yellow)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black)
            }
            
    
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("OK") { }
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                }
                message: {
                    Text("Please read this.")
                }
        
        ZStack(alignment: .top) {
            Color.red
            // Color(red: 1, green: 0.8, blue: 0)
                .frame(width: 200, height: 20)
            // .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Hello, world!")
            Text("This is inside a stack")
        }.background(.red)
        
        ZStack {
            Color.red
            Text("Your content")
        }
        .ignoresSafeArea()
        
        
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(20)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
        
        
        LinearGradient(stops: [
            Gradient.Stop(color: .white, location: 0.45),
            Gradient.Stop(color: .black, location: 0.55),
        ], startPoint: .top, endPoint: .bottom)
        
        // İpucu: Swift burada degrade durakları oluşturduğumuzu biliyor,
        // bu yüzden kısayol olarak Gradient.Stop yerine sadece .init yazabiliriz.
        
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
        
        Button("Delete selection", role: .destructive, action: executeDelete)

    }
    
    func executeDelete() {
            print("Now deleting…")
        }
}


#Preview {
    ContentView()
}
