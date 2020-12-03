//
//  ContentView.swift
//  SwiftUI_text
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var today = Date()
    
    var TOF: Bool = false
    
    var number: Int = 10
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .font(.system(.largeTitle, design: .monospaced)) // 폰트 스타일
                .fontWeight(.heavy) // 글자의 두께
                .background(Color.green) // 배경 색
                .foregroundColor(.white) // 글자 색
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .tracking(10) // 자간
                .font(.system(.body, design: Font.Design.monospaced))
                .multilineTextAlignment(.center) // 글자 정렬 위치
                .lineLimit(10) //글자 줄 수 제한
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/) // 글자 줄 간격
                .truncationMode(.middle) // 글자끝 생략 부분
                .shadow(color: .red, radius: 2, x: 10, y: 10)
                // 그림자 테두리 색, 그림자 선명도, 상하, 좌우
                .padding(20)
                .background(Color.yellow) // 배경색
                .border(Color.black, width: 10) // 테두리 선
                .cornerRadius(20) // 테두리 곡률
            
            Text("today date: \(today, formatter: ContentView.dateFormat)")
            
            Text("Bool data : \(String(TOF))")
            
            Text("number : \(number)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
