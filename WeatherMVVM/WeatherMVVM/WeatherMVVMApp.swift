//
//  WeatherMVVMApp.swift
//  WeatherMVVM
//
//  Created by 맥북에어 on 2020/12/10.
//

import SwiftUI

@main
struct WeatherMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
