//
//  WeatherResponse.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import Foundation


struct WeatherResponse: Decodable {
    
    let current: Current
}
struct Current: Decodable {
    let tempC: Double
    let humidity: Double
    let windKph: Double
    let condition: Condition
}
struct Condition: Decodable {
    let text: String
}
