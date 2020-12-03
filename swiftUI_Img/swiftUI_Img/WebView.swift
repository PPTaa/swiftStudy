//
//  WebView.swift
//  swiftUI_Img
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable{
    
    var url: String
    // ui view making
    func makeUIView(context: Context) -> WKWebView {
        // url unwrapping
        guard let url = URL(string: self.url) else {
            // url 없으면 기본 url 보여줌
            return WKWebView()
        }
        
        // 위에서 받은 url 로 url request 인스턴스 생성
        let urlRequest = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(urlRequest)
        return wkWebview
    }
    // update
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.naver.com")
    }
}
