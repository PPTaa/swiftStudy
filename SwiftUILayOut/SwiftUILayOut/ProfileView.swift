//
//  ProfileView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View{
        ScrollView{
            VStack{
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 250, height: 250, alignment: .center)
                            .overlay(
                                Image(systemName: "figure.walk")
                                    .font(.system(size: 180))
                                , alignment: .center
                            )
                    )
                    .shadow(radius: 4, x:10 ,y:10)
                Text("Swift UI Study")
                    .font(.system(size: 50))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                Text("swift ui 공부중입니다. 멋진 개발자가 될거에용")
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                    
                HStack{
                    Text("구독하러가기")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(Color.pink)
                        .cornerRadius(10)
                    Text("오픈 카톡방 가기")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                } // hstack
            } // Vstack
        } //scroll view
        .navigationBarTitle("내 프로필")
        .navigationBarItems(trailing: NavigationLink(
            destination: Text("실행화면 입니다.")
                .font(.system(size: 50))){
            Image(systemName: "gear")
                .font(.system(size: 35))
                .foregroundColor(.black)
        })
    } // body
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
