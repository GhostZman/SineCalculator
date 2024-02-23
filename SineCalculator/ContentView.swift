//
//  ContentView.swift
//  SineCalculator
//
//  Created by Phys440Zachary on 2/9/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    // State variable to hold the input value and output values
    @State private var inputValue: String = "1"
    @State private var seriesValue: Double = 0
    @State private var exactValue: Double = 0
    
    @Environment(PlotClass.self) var plotData
    @State private var calculator = SineCalculator()
    @State var isChecked:Bool = false
    @State var tempInput = ""
    
    @State var selector = 0
    
    var mySine = SineCalculator()
    
    var body: some View {
        @Bindable var plotData = plotData
        
        VStack {
            Group{
                
                HStack(alignment: .center, spacing: 0) {
                    
                    Text($plotData.plotArray[selector].changingPlotParameters.yLabel.wrappedValue)
                        .rotationEffect(Angle(degrees: -90))
                        .foregroundColor(.red)
                        .padding()
                    VStack {
                        Chart($plotData.plotArray[selector].plotData.wrappedValue) {
                            LineMark(
                                x: .value("Position", $0.xVal),
                                y: .value("Height", $0.yVal)
                                    
                            )
                            .foregroundStyle($plotData.plotArray[selector].changingPlotParameters.lineColor.wrappedValue)
                            PointMark(x: .value("Position", $0.xVal), y: .value("Height", $0.yVal))
                            
                            .foregroundStyle($plotData.plotArray[selector].changingPlotParameters.lineColor.wrappedValue)
                            
                            
                        }
                        .chartYScale(domain: [ plotData.plotArray[selector].changingPlotParameters.yMin ,  plotData.plotArray[selector].changingPlotParameters.yMax ])
                        .chartXScale(domain: [ plotData.plotArray[selector].changingPlotParameters.xMin ,  plotData.plotArray[selector].changingPlotParameters.xMax ])
                        .chartYAxis {
                            AxisMarks(position: .leading)
                        }
                        .padding()
                        Text($plotData.plotArray[selector].changingPlotParameters.xLabel.wrappedValue)
                            .foregroundColor(.red)
                    }
                }
               // .frame(width: 350, height: 400, alignment: .center)
                .frame(alignment: .center)
                
            }
            .padding()
            
            TextField("Enter value of x", text: $inputValue)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Calculate") {
                // Calculate Series and Exact values
                seriesValue = mySine.useTrig(x: Double(inputValue) ?? 1)
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
