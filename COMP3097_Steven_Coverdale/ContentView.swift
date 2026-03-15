//
//  ContentView.swift
//  COMP3097_Steven_Coverdale
//
//  Created by steven coverdale on 2026-03-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...200)
    @State private var lastAnswerCorrect: Bool? = nil
    @State private var correct = 0
    @State private var wrong = 0
    @State private var attempts = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Lab 1 - Prime or Not")
                .font(.title)
            
            Text("\(number)")
                .font(.system(size: 80, weight: .bold))
            
            if let result = lastAnswerCorrect {
                Text(result ? "✓" : "✗")
                    .font(.system(size: 60))
                    .foregroundColor(result ? .green : .red)
            }
            
            Text("Attempts: \(attempts)")
                .font(.headline)
            
            Text("Correct: \(correct)   Wrong: \(wrong)")
                .font(.headline)
            
            HStack(spacing: 40) {
                Button("Prime") {
                    handleAnswer(isPrime(number))
                }
                .font(.title)
                
                Button("Not Prime") {
                    handleAnswer(!isPrime(number))
                }
                .font(.title)
            }
        }
        .padding()
    }
    
    func handleAnswer(_ isCorrect: Bool) {
        attempts += 1
        lastAnswerCorrect = isCorrect
        if isCorrect { correct += 1 } else { wrong += 1 }
        nextNumber()
    }
    
    func nextNumber() {
        number = Int.random(in: 1...200)
    }
    
    func isPrime(_ n: Int) -> Bool {
        if n < 2 { return false }
        for i in 2..<Int(Double(n).squareRoot()) + 1 {
            if n % i == 0 { return false }
        }
        return true
    }
}

#Preview {
    ContentView()
}
