//
//  BasicCard.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/04.
//

import SwiftUI

struct BasicCard : View {
    var body: some View{
        HStack(spacing:20){
            Image(systemName: "flame.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
                Text("화염의 시간")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer().frame(height:5)
                Text("8시 ~ 9시")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicCard()
    }
}
