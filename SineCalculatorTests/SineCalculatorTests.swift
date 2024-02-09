//
//  SineCalculatorTests.swift
//  SineCalculatorTests
//
//  Created by Phys440Zachary on 2/9/24.
//

import XCTest

final class SineCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalcWithN() throws {
        let mySine = SineCalculator()
        
        XCTAssertEqual(mySine.calculateWithN(N: 5, x: 1), sin(1), accuracy: 1.0E-7, "Was not equal to this resolution.")
    }
    
    func testCalcWithStop() throws {
        let mySine = SineCalculator()
        
        XCTAssertEqual(mySine.calculateToSmallTerm(x: 0.1), sin(0.1), accuracy: 1.0E-7, "Was not equal to this resolution.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
