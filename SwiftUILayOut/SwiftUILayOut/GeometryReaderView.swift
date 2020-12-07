//
//  GeometryReaderView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View{
        
        GeometryReader{ geometryReader in
            
            HStack(spacing:0){
                Text("Geo1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width:geometryReader.size.width/3)
                    .background(Color.pink)
                    .foregroundColor(.white)
                Text("Geo2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width:geometryReader.size.width/3)
                    .background(Color.blue)
                    .foregroundColor(.white)
                Text("Geo3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width:geometryReader.size.width/3)
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
            .background(Color.black)
                
        } // geometryReader
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
