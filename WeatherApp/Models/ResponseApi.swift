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
    let dt: Double
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
        let speed: Float
    }
    
    func toModel(img: String?) -> Response {
        Response(
            cityName: name,
            temperature: String(Int(main.temp)),
            minTemperature: String(Int(main.temp_min)),
            maxTemperature: String(Int(main.temp_max)),
            weekday: getWeekday(dt: dt),
            weatherTitle: weather.first?.main,
            weatherDescription: weather.first?.description,
            wind: String(wind.speed),
            humidity: String(main.humidity),
            pressure: String(main.pressure),
            weatherImg: img
        )
    }
    
    func getWeekday(dt: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: dt)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
