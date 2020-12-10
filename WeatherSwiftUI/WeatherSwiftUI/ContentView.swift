//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by 맥북에어 on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                Text("Todays Weather")
                    .font(.system(size: 30, weight: .medium, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .center, spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("-3°")
                        .font(.system(size: 70, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                    }
                
                Spacer()
                HStack{
                    WeatherView()
                    VStack{
                        Text("WED")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium, design: .monospaced))
                        Image(systemName: "sun.max.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        Text("-2°")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium, design: .monospaced))
                    }
                    VStack{
                        Text("THU")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium, design: .monospaced))
                        Image(systemName: "wind")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        Text("-3°")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium, design: .monospaced))
                    }
                    VStack{
                        Text("FRI")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium, design: .monospaced))
                        Image(systemName: "sunset.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        Text("-4°")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium, design: .monospaced))
                    }
                    VStack{
                        Text("SAT")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium, design: .monospaced))
                        Image(systemName: "moon.stars.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        Text("-5°")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium, design: .monospaced))
                    }
                }// hstack
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    Text("Change Time of Day")
                        .font(.system(size: 30, design: .monospaced))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherView: View {
    var body: some View {
    
        VStack{
            Text("TUE")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium, design: .monospaced))
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            Text("-1°")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .medium, design: .monospaced))
        }
    }
}
