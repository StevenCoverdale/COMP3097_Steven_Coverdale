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
    
    @State private var timeRemaining = 5
    @State private var showDialog = false
    @State private var timerPaused = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Lab 1 - Prime or Not")
                .font(.largeTitle)
            
            Text("\(number)")
                .font(.system(size: 80, weight: .bold))
            
            if let result = lastAnswerCorrect {
                Text(result ? "✓" : "✗")
                    .font(.system(size: 60))
                    .foregroundColor(result ? .green : .red)
            }
            
            VStack(spacing: 10) {
                Text("Time: \(timeRemaining)")
                Text("Attempts: \(attempts)")
                Text("Correct: \(correct)   Wrong: \(wrong)")
            }
            .font(.headline)
            
            HStack(spacing: 60) {
                Button("Prime") {
                    handleAnswer(isPrime(number))
                }
                .font(.title2)
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(10)
                
                Button("Not Prime") {
                    handleAnswer(!isPrime(number))
                }
                .font(.title2)
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(10)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if !timerPaused {
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    attempts += 1
                    wrong += 1
                    lastAnswerCorrect = false
                    checkDialog()
                    nextNumber()
                }
            }
        }
        .alert("Results", isPresented: $showDialog) {
            Button("OK") {
                correct = 0
                wrong = 0
                attempts = 0
                timeRemaining = 5
                timerPaused = false
                nextNumber()
            }
        } message: {
            Text("Correct: \(correct)\nWrong: \(wrong)")
        }
    }
    
    func handleAnswer(_ isCorrect: Bool) {
        attempts += 1
        lastAnswerCorrect = isCorrect
        if isCorrect { correct += 1 } else { wrong += 1 }
        checkDialog()
        nextNumber()
    }
    
    func checkDialog() {
        if attempts == 10 {
            timerPaused = true
            showDialog = true
        }
    }
    
    func nextNumber() {
        number = Int.random(in: 1...200)
        timeRemaining = 5
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
