//
//  ContentView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/04.
//

import SwiftUI

struct ContentView: View {
    
    @State
    var isNavigationBar: Bool = false
    
    var body: some View {
        
        NavigationView{
        
            ZStack(alignment: .bottomTrailing){
                VStack(alignment:.leading, spacing:0){
                    
                    HStack{
                        NavigationLink(destination: MyList(isNavigationBar: self.$isNavigationBar)){
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                    } // Hstack
                    .padding(10)
                    Text("Todo List")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(10)
                
                    ScrollView{
                        VStack{
                            Card()
                            MyCard(icon: "doc.fill", title: "MyCard1", start: "10am", end: "11am", bgColor: Color.black)
                            MyCard(icon: "tray.fill", title: "Clean", start: "9am", end: "10am", bgColor: Color.blue)
                            MyCard(icon: "flame.fill", title: "Camp fire", start: "9pm", end: "11pm", bgColor: Color.red)
                            MyCard(icon: "4k.tv", title: "Watch Tv", start: "6pm", end: "8pm", bgColor: Color.orange)
                        } // Vstack
                        .padding(.horizontal,10)
                        .padding(.bottom, 20)
                    } // Scroll view
                } // Vstack
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(10)
                    .shadow(radius: 20)
                    
            } // zstack
            
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBar)
            .onAppear{
                self.isNavigationBar = true
            }
            
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
