//
//  QRCodeScannerExampleView.swift
//  QRReaderApp
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?

    var body: some View {
        ZStack{
             
            if self.scannedCode != nil {
                Text("self.scannedCode : \(self.scannedCode!)" )
                QRWebView(urlToLoad: self.scannedCode!)
            } else {
//                Text("aaa")
//                QRWebView(urlToLoad: "\(self.scannedCode)")
                QRWebView(urlToLoad: "https://m.naver.com")
            }
            
            VStack{
                Spacer()
                
                Button(action: {
                    self.isPresentingScanner = true
                }){
                    Text("큐알코드 스캔하기")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 5)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Spacer().frame(height:50)
            }
        }
    }

    var scannerSheet : some View {
        ZStack{
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
            QRCodeGuideLineView()
        }
    }
}


struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}

