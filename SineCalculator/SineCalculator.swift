//
//  SineCalculator.swift
//  SineCalculator
//
//  Created by Phys440Zachary on 2/9/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class SineCalculator {
    
    func factorial(x: Int64) -> Int64{
        if x > 1 {
            return x * factorial(x: (x-1))
        }
        return 1
    }
    
    func calculateWithN(N: Int, x: Double) -> Double{
        
        var sine: Double = 0.0
        for n in 1...N {
            sine += pow(-1.0, Double(n-1)) * pow(x, Double(2*n-1)) / Double(factorial(x: Int64(2*n - 1)))
        }
        return sine
    }
    
    func calculateToSmallTerm(x: Double) -> Double {
        var sine: Double = 0.0
        
        var n: Int = 1
        var nextTerm: Double
        repeat{
            nextTerm = pow(-1.0, Double(n-1)) * pow(x, Double(2*n-1))
            for i in 1...(2*n-1){
                nextTerm = nextTerm / Double(i)
            }
            sine += nextTerm
            n += 1
        } while abs(nextTerm) > 1E-7 * sine
        return sine
    }
    
    func useTrig(x: Double) -> Double {
        var newX: Double = x
        while newX > 2 * Double.pi {
            newX = newX - (2 * Double.pi)
        }
        
        if newX > Double.pi{
            return -1.0 * self.calculateToSmallTerm(x: newX - Double.pi)
        }
        
        return self.calculateToSmallTerm(x: newX)
    }
}
