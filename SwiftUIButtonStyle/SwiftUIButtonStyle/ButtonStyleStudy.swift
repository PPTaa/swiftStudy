//
//  ButtonStyleStudy.swift
//  SwiftUIButtonStyle
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

enum haptic {
    case tab, long
}

struct ButtonStyleStudy: ButtonStyle {
    
    var btnColor: Color
    var fontColor: Color
    var scale: Float
    var rotate: Double
    var blur: Int
    var haptic: haptic?
    
    func makeBody(configuration: Configuration) -> some View {
        
        // 버튼의 라벨
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(fontColor)
            .padding()
            .background(btnColor)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? CGFloat(scale) : 1)
            .rotationEffect(configuration.isPressed ? .degrees(rotate) : .degrees(0), anchor: .bottomTrailing)
            .blur(radius: configuration.isPressed ? CGFloat(blur) : 0)
            .onTapGesture {
                if (self.haptic == .tab){
                    let hap = UIImpactFeedbackGenerator(style: .heavy)
                    hap.impactOccurred()
                }
            }
            .onLongPressGesture {
                if (self.haptic == .long){
                    let hap = UIImpactFeedbackGenerator(style: .heavy)
                    hap.impactOccurred()
                }
            }
            .padding()
        
        // 버튼이 클릭되었는지
//        configuration.isPressed
    
    }
}

struct ButtonStyleStudy_Preview: PreviewProvider {
    static var previews: some View{
//        ButtonStyleStudy()
        Button(action: {
            print("button cilck")
        }, label: {
            Text("Button")
        }).buttonStyle(ButtonStyleStudy(btnColor: Color.black, fontColor: Color.yellow,scale: 0.5, rotate: 180, blur: 10, haptic: .long))
    }
}
