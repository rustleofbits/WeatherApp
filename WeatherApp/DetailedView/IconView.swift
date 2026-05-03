//
//  IconView.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct IconView: View {
    let title: String?
    let description: String?
    let iconId: String?
    
    var body: some View {
        VStack {
            let url = URL(string: "https://openweathermap.org/img/wn/\(iconId ?? "")@2x.png")
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                case .failure:
                    Image("weatherIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                @unknown default:
                    Image("weatherIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
            }
            VStack(spacing: 5) {
                Text(title ?? "").font(.title)
                Text(description ?? "").foregroundStyle(Color(hex: "4A4A4A"))
            }
        }
    }
}
