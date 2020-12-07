//
//  StudyZStack.swift
//  SwiftStack
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct StudyZStack: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:100, height:300)
                .foregroundColor(.red)
                .zIndex(1)
            Rectangle()
                .frame(width:200, height:200)
                .foregroundColor(.yellow)
                .zIndex(3)
            Rectangle()
                .frame(width:300, height:100)
                .foregroundColor(.blue)
                .zIndex(2)
            
        }
    }
}

struct StudyZStack_Previews: PreviewProvider {
    static var previews: some View {
        StudyZStack()
    }
}
