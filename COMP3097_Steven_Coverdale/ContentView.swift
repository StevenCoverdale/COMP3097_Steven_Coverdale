//
//  ContentView.swift
//  COMP3097_Steven_Coverdale
//
//  Created by steven coverdale on 2026-03-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...200)
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Lab 1 - Prime or Not")
                .font(.title)
            
            Text("\(number)")
                .font(.system(size: 80, weight: .bold))
            
            HStack(spacing: 40) {
                Button("Prime") {
                    // logic later
                }
                .font(.title)
                
                Button("Not Prime") {
                    // logic later
                }
                .font(.title)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
