//
//  TabView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

struct MyTabView: View {
    var body: some View{
        
        TabView{
            MyView(content: "1번 탭 클릭", bgcolor: Color.green)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            
            MyView(content: "2번 탭 클릭", bgcolor: Color.orange)
                .tabItem {
                    Image(systemName: "doc.fill")
                    
                    Text("2번")
                }
                .tag(1)
            
            MyView(content: "3번 탭 클릭", bgcolor: Color.gray)
                .tabItem {
                    Image(systemName: "plus")
                    Text("3번")
                }
                .tag(2)
        }
        
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
