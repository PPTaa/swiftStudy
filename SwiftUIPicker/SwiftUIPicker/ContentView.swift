//
//  ContentView.swift
//  SwiftUIPicker
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

enum color: String, CaseIterable, Identifiable {
    case red, green, blue

    var id: String { self.rawValue }
}

struct ContentView: View {
    
    @State private var selectedColor = color.red
    
    func changeColor(color: String) -> Color{
        
        switch color {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "blue":
            return Color.blue
        default:
            return Color.red
        }
        return Color.black
    }
    
    var body: some View {
        VStack{
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(changeColor(color: selectedColor.rawValue))
            
            Text("Selected Color: \(selectedColor.rawValue)")
            Picker("Color", selection: $selectedColor, content: {
                Text("레드").tag(color.red)
                Text("그린").tag(color.green)
                Text("블루").tag(color.blue)
            })
            .pickerStyle(SegmentedPickerStyle())
                
            Picker("Color", selection: $selectedColor, content: {
                Text("레드").tag(color.red)
                Text("그린").tag(color.green)
                Text("블루").tag(color.blue)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
