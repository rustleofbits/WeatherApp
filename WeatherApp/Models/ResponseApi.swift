//
//  ResponseApi.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 02.05.2026.
//

import Foundation

struct ResponseApi: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let dt: TimeInterval
    let wind: Wind
    
    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
        let pressure: Int
    }
    
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Wind: Decodable {
        let speed: Double
    }
    
    func toModel() -> Response {
        Response(
            cityName: name,
            temperature: String(Int(main.temp)),
            minTemperature: String(Int(main.temp_min)),
            maxTemperature: String(Int(main.temp_max)),
            weekday: getWeekday(dt: dt),
            weatherTitle: weather.first?.main,
            weatherDescription: weather.first?.description,
            wind: String(format: "%.1f", wind.speed),
            humidity: String(main.humidity),
            pressure: String(main.pressure),
            iconId: weather.first?.icon
        )
    }
    
    func getWeekday(dt: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: dt)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
