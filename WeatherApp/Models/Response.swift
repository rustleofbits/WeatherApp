//
//  Response.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 02.05.2026.
//

import Foundation

struct Response: Hashable {
    let cityName: String
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let weekday: String
    let weatherTitle: String?
    let weatherDescription: String?
    let wind: String
    let humidity: String
    let pressure: String
    let iconId: String?
}
