//
//  SineCalculatorApp.swift
//  SineCalculator
//
//  Created by Phys440Zachary on 2/9/24.
//

import SwiftUI

@main
struct SineCalculatorApp: App {
    
    @State var plotData = PlotClass()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environment(plotData)
        }
    }
}
