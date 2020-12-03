//
//  ContentView.swift
//  swiftUI_Img
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("Image")
                    .frame(height: 10)
                    .offset(y : -600)
                CircleImgView()
                HStack{
                    NavigationLink(destination: WebView(url: "https://pptaa.github.io")
                                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    ){
                        Text("블로그로 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: WebView(url: "https://www.naver.com")
                                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    ){
                        Text("네이버로 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }// Hstack
                .padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
