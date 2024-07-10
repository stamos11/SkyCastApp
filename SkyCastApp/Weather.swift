//
//  Weather.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import Foundation


struct Weather: Decodable {
    let temperature: Double
    let humidity: Double
    let windSpeed: Double
    let description: String
    
}
