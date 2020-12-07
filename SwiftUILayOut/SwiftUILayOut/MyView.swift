//
//  MyView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI


struct MyView: View {
    
    var content: String
    var bgcolor: Color
    
    
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text(content)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer()
            } // Hstack
//            .background(Color.blue)
            Spacer()
        }//vstack
        .background(bgcolor)
        .animation(.none)
//        .ignoresSafeArea(.all)
    }//body
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(content: "bbb", bgcolor: Color.pink)
    }
}
