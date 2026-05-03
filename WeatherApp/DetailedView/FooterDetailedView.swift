//
//  FooterDetailedView.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct FooterDetailedView: View {
    let wind: String
    let humidity: String
    let pressure: String

    var body: some View {
        HStack {
            VStack {
                Image(systemName: "wind")
                Text("Wind")
                Text(wind) + Text("m/s")
            }
            Spacer()
            VStack {
                Image(systemName: "humidity")
                Text("Humidity")
                Text(humidity) + Text("%")
            }
            Spacer()
            VStack {
                Image(systemName: "thermometer.tirepressure")
                Text("Pressure")
                Text(pressure) + Text("hPa")
            }
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
    }
}
