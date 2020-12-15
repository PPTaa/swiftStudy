//
//  Weather.swift
//  WeatherMVVM
//
//  Created by 맥북에어 on 2020/12/10.
//


// MODEL
import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let temperature_min: String
    let temperature_max: String
    let description: String
    let iconName: String
    
    init(response : APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        temperature_min = "\(Int(response.main.temp_min))"
        temperature_max = "\(Int(response.main.temp_max))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
        
    }
}
