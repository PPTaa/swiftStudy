//
//  MyList.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

struct MyList: View {
    
    @Binding
    var isNavigationBar: Bool
    
    init(isNavigationBar: Binding<Bool> = .constant(false)){
        if #available(iOS 14.0, *){
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        _isNavigationBar = isNavigationBar
    }
    
    var body: some View{
//        Text("Mylist")
//        List{
//            Text("Mylist0")
//            Text("Mylist1")
//            Text("Mylist2")
//            Text("Mylist3")
//
//        }
//        List{
//            ForEach(1...10, id: \.self){
//                Text("for each \($0)")
//            }
//        }
        List{
            Section(
                header: Text("오늘 할일")
                    .font(.headline)
                    .foregroundColor(.black),
                footer: Text("footer")
            ){
                ForEach(1...10, id: \.self){ itemIndex in
    //                Text("for each \(itemIndex)")
                    MyCard(icon: "doc.fill", title: "list test\(itemIndex)", start: "\(itemIndex)pm", end: "\(itemIndex+1)pm", bgColor: Color.blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            Section(header: Text("내일 할일")){
                ForEach(1...3, id: \.self){ itemIndex in
    //                Text("for each \(itemIndex)")
                    MyCard(icon: "doc.fill", title: "list test\(itemIndex)", start: "\(itemIndex)pm", end: "\(itemIndex+1)pm", bgColor: Color.green)
                }
            }
            .listRowBackground(Color.orange)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("내 목록")
//        .navigationBarHidden(self.isNavigationBar)
        .onAppear{
            self.isNavigationBar = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
