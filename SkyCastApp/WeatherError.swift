//
//  Erro.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 11/7/24.
//

import Foundation

enum WeatherError: Error {
    
    case networkError
    case dataNotFound
    case decodingError
    case unknownError
}
