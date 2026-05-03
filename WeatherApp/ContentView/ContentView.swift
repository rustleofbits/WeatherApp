//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dinara Shadyarova on 02.05.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Image("weatherIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                VStack {
                    TextField("Enter your city", text: $viewModel.cityName) {
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay(alignment: .center) {
                        RoundedRectangle(cornerRadius: 20).stroke(.gray)
                    }
                    .autocorrectionDisabled()
                    Button("Find") {
                        Task {
                            await viewModel.onFind()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .cornerRadius(20)
                    .foregroundStyle(.white)
                }
                Spacer()
            }
            .navigationTitle("Weather app")
            .padding()
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.8))
                    .tint(.white)
            }
        }
        .navigationDestination(item: $viewModel.response) { response in
            DetailedView(response: response)
        }
        .alert("Something went wrong", isPresented: $viewModel.showError) {
            Button("OK") {}
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
