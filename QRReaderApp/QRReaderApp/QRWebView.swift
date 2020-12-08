//
//  WebView.swift
//  QRReaderApp
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI
import WebKit

struct QRWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        
        // 웹뷰 인스턴스 생성
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<QRWebView> ) {
    }
}

struct QRWebView_Previews: PreviewProvider {
    static var previews: some View {
        QRWebView(urlToLoad: "https://m.naver.com")
    }
}
