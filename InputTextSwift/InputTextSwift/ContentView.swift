//
//  ContentView.swift
//  InputTextSwift
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nameValue: String = ""
    @State private var passwordValue: String = ""
    
    
    var body: some View {
        // 일반적 글자입력
        GeometryReader{ geo in
            VStack(alignment: .center, spacing: 10){
                HStack{
                    TextField("사용자 이름", text: $nameValue)
                        .autocapitalization(.none) // 들어가는 문자 자동 대문자 설정
                        .disableAutocorrection(true) // 자동완성 기능 제거
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if (self.nameValue != "") {
                        Button(action: {
                            self.nameValue = ""
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.black)
                        })
                    }
                }
                .padding(.horizontal, 30)
                HStack{
                    SecureField("비밀번호", text: $passwordValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if (self.passwordValue != "") {
                        Button(action: {
                            self.passwordValue = ""
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.black)
                        })
                    }
                }
                .padding(.horizontal, 30)
                Text("비밀번호 : \(passwordValue)")
            }.position(x:geo.frame(in:.global).midX,y:geo.frame(in:.global).midY)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
