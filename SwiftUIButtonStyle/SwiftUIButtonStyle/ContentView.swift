//
//  ContentView.swift
//  SwiftUIButtonStyle
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                print("button1 click")
            }, label: {
                Text("탭")
            }).buttonStyle(ButtonStyleStudy(btnColor: Color.blue, fontColor: Color.white, scale: 2, rotate: 0, blur: 0,haptic: .tab))
            
            Button(action: {
                print("button2 click")
            }, label: {
                Text("롱클릭")
            }).buttonStyle(ButtonStyleStudy(btnColor: Color.green, fontColor: Color.white, scale: 2, rotate: 0, blur: 0, haptic: .long))
        
            Button(action: {
                print("button3 click")
            }, label: {
                Text("축소 버튼")
            }).buttonStyle(ButtonStyleStudy(btnColor: Color.purple, fontColor: Color.white, scale: 0.5, rotate: 0, blur: 0))
        
            Button(action: {
                print("button4 click")
            }, label: {
                Text("회전 버튼")
            }).buttonStyle(ButtonStyleStudy(btnColor: Color.pink, fontColor: Color.white, scale: 0, rotate: 90, blur: 0))
        
            Button(action: {
                print("button5 click")
            }, label: {
                Text("블러 버튼")
            }).buttonStyle(ButtonStyleStudy(btnColor: Color.black, fontColor: Color.white, scale: 1, rotate: 0, blur: 4))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
