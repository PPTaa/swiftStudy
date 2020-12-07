//
//  MyGeoview.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

enum Index {
    case zero, one, two, three
}

struct MyGeoview: View {
    
    @State
    var index: Index = .zero
    
    var body: some View{
        GeometryReader{ geometryReader in
            VStack{
                Button(action: {
                    print("1번클릭")
                    withAnimation{
                        self.index = .one
                    }
                }){
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(width:80, height:geometryReader.size.height/3)
                        .padding(.horizontal, self.index == .one ? 100: 0)
                        .background(Color.blue)
                }
                Button(action:{
                    print("2번클릭")
                    withAnimation{
                        self.index = .two
                    }
                    
                }){
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(width:80, height:geometryReader.size.height/3)
                        .padding(.horizontal, self.index == .two ? 100: 0)
                        .background(Color.black)
                }
                Button(action:{
                    print("3번클릭")
                    withAnimation{
                        self.index = .three
                    }
                }){
                    Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .frame(width:80, height:geometryReader.size.height/3)
                    .padding(.horizontal, self.index == .three ? 100: 0)
                    .background(Color.red)
                }
            } // vstack
            .frame(width: geometryReader.size.width, height: geometryReader.size.height)
        } // geometryReader
        .background(Color.yellow)
        .ignoresSafeArea(.all)
        
    }
}

struct MyGeoview_Previews: PreviewProvider {
    static var previews: some View {
        MyGeoview()
    }
}
