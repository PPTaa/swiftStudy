//
//  StudyHStack.swift
//  SwiftStack
//
//  Created by 맥북에어 on 2020/12/03.
//

import SwiftUI

struct StudyHStack: View {
    var body: some View {
        HStack(alignment: .center){
            
//            Divider()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
//            Rectangle()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.red)
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
                .font(.system(size: 70))
//                .frame(width:100, height:100)
        }//hstack
        .padding()
        .background(Color.green)
    }
}

struct StudyHStack_Previews: PreviewProvider {
    static var previews: some View {
        StudyHStack()
    }
}
