//
//  ContentView.swift
//  WeatherMVVM
//
//  Created by 맥북에어 on 2020/12/10.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Divider()
                    .opacity(0)
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack {
                Text(viewModel.cityName)
                    .font(.largeTitle)
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                Text(viewModel.weatherIcon)
                    .font(.largeTitle)
                    .padding()
                HStack{
                    Text("최고 기온 : \(viewModel.temperature_max)")
                    Divider()
                        .background(Color.black)
                        .frame(height:20)
                    Text("최저 기온 : \(viewModel.temperature_min)")
                }
                Text(viewModel.weatherDescription)
            }.onAppear(perform: viewModel.refresh)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
