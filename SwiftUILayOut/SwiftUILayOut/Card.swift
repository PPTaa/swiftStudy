//
//  Card.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/04.
//

import SwiftUI

struct Card: View {
    
    @State
    var shouldShowAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing : 0){
            
            Text("Todo List")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .padding(.bottom, 10)
            Text("10시~11시")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack{
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.green))
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                
                //
                Button(action: {
                    print("click button")
                    self.shouldShowAlert = true
                    
                }){
                
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width:80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .alert(isPresented: $shouldShowAlert){
                    Alert(title: Text("확인이 클릭되었습니다."))
                }
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(20)
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Card()
        }
    }
}
