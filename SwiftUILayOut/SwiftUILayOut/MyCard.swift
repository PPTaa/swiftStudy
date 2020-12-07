//
//  BasicCard.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/04.
//

import SwiftUI

struct MyCard : View {
    
    var icon : String
    var title : String
    var start : String
    var end : String
    var bgColor : Color
    
    var body: some View{
        HStack(spacing:20){
            Image(systemName: icon)
                .font(.system(size: 50))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer().frame(height:5)
                Text("\(start)~ \(end)")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "doc.fill", title: "타이틀 테스트", start: "11am", end: "04pm", bgColor: Color.green)
    }
}
