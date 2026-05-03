//
//  DetailedView.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 02.05.2026.
//

import SwiftUI

struct DetailedView: View {
    let response: Response
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                TemperatureView(
                    temperature: response.temperature,
                    minTemperature: response.minTemperature,
                    maxTemperature: response.maxTemperature,
                    weekday: response.weekday
                )
                IconView(title: response.weatherTitle, description: response.weatherDescription)
            }
            Spacer()
            FooterDetailedView(
                wind: response.wind,
                humidity: response.humidity,
                pressure: response.pressure
            )
        }
        .navigationTitle(response.cityName)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        DetailedView(
            response: Response(
                cityName: "Almaty",
                temperature: "30",
                minTemperature: "20°C",
                maxTemperature: "35°C",
                weekday: "Monday",
                weatherTitle: "Drizzle",
                weatherDescription: "Slight drizzle",
                wind: "30",
                humidity: "40",
                pressure: "50",
                weatherImg: nil
            )
        )
    }
}
