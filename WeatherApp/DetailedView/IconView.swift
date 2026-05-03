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
                case .failure(let error):
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
public extension Color {
     init(hex: String) {
         let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
         var int: UInt64 = 0
         Scanner(string: hex).scanHexInt64(&int)
         let r = Double((int >> 16) & 0xFF) / 255
         let g = Double((int >> 8) & 0xFF) / 255
         let b = Double(int & 0xFF) / 255
         self.init(red: r, green: g, blue: b)
     }
 }
    
