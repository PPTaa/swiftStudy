//
//  MyNavigationView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View{
        
        NavigationView{
//            Text("myNavi view ")
            MyList()
                .navigationBarTitle("하이", displayMode: .large)
                .navigationBarItems(
                    leading: Button(action:{
                        print("click lead")
                    }){
                        Text("lead")
                    },
                    trailing: NavigationLink(destination:
                        Text("click trailing")
                    ){
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    })
            
                
        }
        
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
