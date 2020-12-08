//
//  QRCodeGuideLineView.swift
//  QRReaderApp
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI

struct QRCodeGuideLineView: View {
    var body: some View{
        GeometryReader{ geo in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [10]))
                .frame(width: geo.size.width/2, height: geo.size.height/3)
                .position(x: geo.frame(in: .global).midX, y: geo.frame(in: .global).midY)
                .foregroundColor(.orange)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View{
        QRCodeGuideLineView()
    }
}
