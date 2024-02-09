//
//  ContentView.swift
//  SineCalculator
//
//  Created by Phys440Zachary on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    // State variable to hold the input value and output values
    @State private var inputValue: String = "1"
    @State private var seriesValue: Double = 0
    @State private var exactValue: Double = 0
    
    var mySine = SineCalculator()
    
    var body: some View {
        VStack {
            TextField("Enter value of x", text: $inputValue)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Calculate") {
                // Calculate Series and Exact values
                seriesValue = mySine.calculateToSmallTerm(x: Double(inputValue) ?? 1)
                exactValue = sin(Double(inputValue) ?? 1)
            }
            .padding()
            
            // Display the output fields
            VStack(alignment: .leading) {
                Text("Series: \(seriesValue)")
                Text("Exact: \(exactValue)")
            }
            .padding()
        }
        .padding()
    }
}
