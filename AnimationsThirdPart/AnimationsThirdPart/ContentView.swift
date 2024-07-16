//
//  ContentView.swift
//  AnimationsThirdPart
//
//  Created by Beyza Zengin on 15.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let letters = Array("Hello SwiftUI")

    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false

    var body: some View {
        
        VStack {
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
            
      
            
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                       .frame(width: 300, height: 200)
                       .clipShape(.rect(cornerRadius: 10))
                       .offset(dragAmount)
                       .gesture(
                           DragGesture()
                               .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.bouncy) {
                                    dragAmount = .zero
                                }
                            }
                       )
            
// .bouncy, SwiftUI için yerleşik animasyon seçeneklerinden biridir
//ve hafifçe zıplayan bir yay üretir.

            HStack(spacing: 0) {
                        ForEach(0..<letters.count, id: \.self) { num in
                            Text(String(letters[num]))
                                .padding(5)
                                .font(.title)
                                .background(enabled ? .blue : .red)
                                .offset(dragAmount)
                                .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                dragAmount = .zero
                                enabled.toggle()
                            }
                    )
            
            Button("Tap Me") {
                isShowingRed.toggle()
                }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
 
            
        }
        .padding()
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
    
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


#Preview {
    ContentView()
}
