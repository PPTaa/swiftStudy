//
//  ContentView.swift
//  SwiftUIWebViewStart
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyWebView(urlToLoad: "http:smartsearch.smartmobilityinc.co.kr/handycab.html").edgesIgnoringSafeArea(.all)
        
//        NavigationView{
//            HStack{
//                NavigationLink(
//                    destination: MyWebView(urlToLoad: "http:smartsearch.smartmobilityinc.co.kr/handycab.html")
//                        .edgesIgnoringSafeArea(.all)){
//                    Text("Naver")
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                        .padding(20)
//                        .background(Color.green)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                }
//                NavigationLink(
//                    destination: MyWebView(urlToLoad: "https://www.daum.net")
//                        .edgesIgnoringSafeArea(.all)){
//                    Text("Daum")
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                        .padding(20)
//                        .background(Color.yellow)
//                        .foregroundColor(Color.black)
//                        .cornerRadius(10)
//                }
//                NavigationLink(
//                    destination: MyWebView(urlToLoad: "https://www.google.com")
//                        .edgesIgnoringSafeArea(.all)){
//                    Text("Google")
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                        .padding(20)
//                        .background(Color.blue)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
