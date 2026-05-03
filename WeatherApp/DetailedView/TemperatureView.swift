//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct TemperatureView: View {
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let weekday: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text(temperature)
                        .font(.system(size: 80))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Text("°C")
                        .font(.system(size: 50))
                }
                Text(weekday).font(.title)
            }
            Spacer()
            VStack(spacing: 30) {
                HStack(spacing: 10) {
                    Image(systemName: "arrow.up")
                        .bold()
                        .font(.caption)
                    HStack(spacing: 0) {
                        Text(maxTemperature)
                        Text("°C")
                    }
                    .font(.title3)
                }
                .foregroundStyle(Color(hex: "4A4A4A"))
                HStack(spacing: 10) {
                    Image(systemName: "arrow.down")
                        .bold()
                        .font(.caption)
                    HStack(spacing: 0) {
                        Text(minTemperature)
                        Text("°C")
                    }
                    .font(.title3)
                }.foregroundStyle(Color(hex: "4A4A4A"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}
