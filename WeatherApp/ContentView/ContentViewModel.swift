//
//  ContentViewModel.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 02.05.2026.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    private let urlString = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "7978d7a381fe1bb407b2a344031259bf"
    
    @Published var cityName: String = ""
    @Published var isLoading = false
    @Published var response: Response? = nil
    @Published var errorMessage: String? = nil
    @Published var showError: Bool = false
    
    @MainActor
    func onFind() async {
        isLoading = true
        showError = false
        guard var url = URL(string: urlString) else { return }
        url.append(
            queryItems: [
                URLQueryItem(name: "q", value: cityName),
                URLQueryItem(name: "appid", value: apiKey),
                URLQueryItem(name: "units", value: "metric")
            ]
        )
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
            
            response = decoded.toModel(img: nil)
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            showError = true
        }
    }
}
//https://openweathermap.org/payload/api/media/file/10d@2x.png
