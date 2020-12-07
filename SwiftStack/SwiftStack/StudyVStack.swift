//
//  StudyVStack.swift
//  SwiftStack
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct StudyVStack : View{
    
    var body: some View {
        // spacing 스택간 간격
        VStack(alignment:.leading ,spacing:0){
            
            Spacer() // 스페이서를 사용하여 위치조절 가능
            
            Text("Text")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
//            Divider() // stack 에 alignment를 모두 적용시킴
//                .opacity(0) // divider 구분선 안보이게
            
            Rectangle()
                .frame(width: 100 ,height:100)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(width: 100 ,height:100)
                .foregroundColor(.red)
            Rectangle()
                .frame(width: 100 ,height:100)
                .foregroundColor(.orange)
            Rectangle()
                .frame(width: 100 ,height:100)
                .foregroundColor(.yellow)
            Spacer()
                .frame(height:20) // 스페이서의 크기도 조정 가능
            
            Rectangle()
                .frame(width: 100 ,height:100)
            
            Spacer()
        }// vstack
        .frame(width: 300)
        .background(Color.green)
    }
    
}

struct StudyVStack_Previews: PreviewProvider {
    static var previews: some View {
        StudyVStack()
    }
}
