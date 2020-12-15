//
//  WeatherViewModel.swift
//  WeatherMVVM
//
//  Created by 맥북에어 on 2020/12/10.
//

import Foundation

private let defaultIcon = "❓"

private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" : "🌧",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️",
    "Haze" : "🌫" 
    
]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var temperature_min: String = "--"
    @Published var temperature_max: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        print("refresh VM")
        weatherService.loadWeatherData{weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)ºC"
                self.temperature_min = "\(weather.temperature_min)ºC"
                self.temperature_max = "\(weather.temperature_max)ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
