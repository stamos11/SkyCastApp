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
    let temp_c: Double
    let humidity: Double
    let wind_kph: Double
    let condition: Condition
}
struct Condition: Decodable {
    let text: String
}
