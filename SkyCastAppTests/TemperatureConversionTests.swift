//
//  TemperatureConversionTests.swift
//  SkyCastAppTests
//
//  Created by stamoulis nikolaos on 11/7/24.
//

import XCTest
@testable import SkyCastApp


    class TemperatureConversionTests: XCTestCase {
//Test for converting 0 degrees Celsius to Farenheit
    func testCelsiusToFahrenheit() {
           let celsius = 0.0
           let expectedFahrenheit = 32.0
           let result = celsiusToFarenheit(celsius)
        //Assert that the result is equal to the expected vaalue with a tolerance
           XCTAssertEqual(result, expectedFahrenheit, accuracy: 0.1)
       }
      //Test case for converting -40 degrees celsius to Farenheit
       func testCelsiusToFahrenheitNegative() {
           let celsius = -40.0
           let expectedFahrenheit = -40.0
           let result = celsiusToFarenheit(celsius)
           XCTAssertEqual(result, expectedFahrenheit, accuracy: 0.1)
       }
       // Test case for converting 100 degrees Celsius to Farenheit
       func testCelsiusToFahrenheitPositive() {
           let celsius = 100.0
           let expectedFahrenheit = 212.0
           let result = celsiusToFarenheit(celsius)
           XCTAssertEqual(result, expectedFahrenheit, accuracy: 0.1)
       }

}
