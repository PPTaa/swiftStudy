//
//  CircleImgView.swift
//  swiftUI_Img
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct CircleImgView : View {
    var body: some View {
//        Image(systemName: "pencil.slash")
//            .font(.system(size: 200))
//            .foregroundColor(.red)
//            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3, x: 5, y: 10)
        Image("Image")
            .resizable()
            .scaledToFill()
//            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300) // 이미지 사이즈 조정
            .clipShape(Circle())
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
            .overlay(Circle().foregroundColor(.black)
                        .opacity(0.3)) // opacity 투명도
            .overlay(Circle().stroke(Color.red, lineWidth: 10)
                        .padding(20)) // stroke 윤곽선
            .overlay(Circle().stroke(Color.yellow, lineWidth: 10)
                        .padding(40))
            .overlay(Circle().stroke(Color.black, lineWidth: 10))
            
            .overlay(Text("텍스트입니다").foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold))
//            .clipped() // 그 사이즈에 맞게 자름
//            .edgesIgnoringSafeArea(.all)
            
    }
}

struct CircleImgView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImgView()
    }
}
