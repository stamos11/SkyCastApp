//
//  ForecastResponse.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import Foundation

struct ForecastResponse: Decodable {
    let forecast: ForecastContainer
}
struct ForecastContainer: Decodable {
    let forecastday: [ForecastDay]
}
struct ForecastDay: Decodable {
    let date: String
    let day: Day
}
struct Day: Decodable {
    let avgtemp_c: Double
    let condition: Condition
}
