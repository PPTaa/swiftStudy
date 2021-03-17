//
//  MyWebView.swift
//  SwiftUIWebViewStart
//
//  Created by 맥북에어 on 2020/12/03.
//

import Foundation
import SwiftUI
import WebKit

// ui킷의 ui뷰를 사용할 수 있도록 설정해준다.
// UiViewControllerRepresentable
struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // webview 인스턴스 생성
        let webview = WKWebView()
        // webview 로드
        webview.load(URLRequest(url: url))
        
        return webview
        
    }
    
    // update ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "http:smartsearch.smartmobilityinc.co.kr/handycab.html")
    }
}
