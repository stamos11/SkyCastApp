//
//  CelsiusToFarenheit+Util.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 11/7/24.
//

import Foundation

func celsiusToFarenheit(_ celsius: Double) -> Double {
    return (celsius * 9 / 5) + 32
}
func formatTemperature(_ temprature: Double) -> String {
    return String(format: "%.1f", temprature)
}
