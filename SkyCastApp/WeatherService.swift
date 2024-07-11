//
//  WeatherService.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import Foundation


class WeatherService {
    
    
    func getWeather(for city: String, isCelsius: Bool, completion: @escaping (Result<Weather, WeatherError>) -> Void) {
        let unit = isCelsius ? "C" : "F"
        let urlString = "\(Constants.baseUrl)/current.json?key=\(Constants.apiKey)&q=\(city)&aqi=no"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.dataNotFound))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError))
            }
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(WeatherResponse.self, from: data)
                let weather = Weather(
                    temperature: response.current.tempC,
                    humidity: response.current.humidity,
                    windSpeed: response.current.windKph,
                    description: response.current.condition.text
                    )
                completion(.success(weather))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    func getForecast(for city: String, isCelsius: Bool, completion: @escaping (Result<[Forecast], WeatherError>) -> Void) {
        
        let urlString = "\(Constants.baseUrl)/forecast.json?key=\(Constants.apiKey)&q=\(city)&days=7&aqi=no&alerts=no"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.dataNotFound))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = decoder.decode(ForecastResponse.self, from: data)
                let forecast = response.forecast.forecastday.map { day in
                    Forecast(
                        date: day.date,
                        temperature: day.day.avgtempC,
                        description: day.day.condition.text
                    )
                }
                completion(.success(forecast))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
