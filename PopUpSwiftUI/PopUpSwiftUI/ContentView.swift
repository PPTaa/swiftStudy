//
//  ContentView.swift
//  PopUpSwiftUI
//
//  Created by 맥북에어 on 2020/12/08.
//

import SwiftUI
import ExytePopupView

struct ContentView: View {

    @State var showBottomSolidMessage : Bool = false
    @State var showBottomToastMessage : Bool = false
    @State var showTopSolidMessage : Bool = false
    @State var showTopToastMessage : Bool = false
    @State var showPopUpMessage : Bool = false
    
    func createSolidMessage(bgColor:Color) -> some View {
        HStack(alignment:.center , spacing:10){
            Image(systemName: "paperplane")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading){
                Text("Solid")
                    .foregroundColor(.white)
                Text(" Solid message 띄우기")
                    .lineLimit(3)
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 15)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 0 : 30)
        .background(bgColor)
    }
    
    func createToastMessage(bgColor:Color) -> some View {
        HStack(spacing:10){
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text("Toast")
                    .foregroundColor(.white)
                Text(" Toast message 띄우기")
                    .lineLimit(3)
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding(15)
        .frame(width: 300)
        .background(bgColor)
        .cornerRadius(20)
    }
    
    func createPopup(bgColor: Color) -> some View {
        VStack(alignment: .center, spacing: 10){
            Image(systemName: "figure.stand.line.dotted.figure.stand")
                .font(.system(size: 100))
                .padding(.horizontal, 10)
            Text("What is Lorem Ipsum?")
                .font(.system(.largeTitle))
                .fontWeight(.black)
                .padding(.horizontal, 10)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
            Button(action: {
                self.showPopUpMessage = false
                
            }, label: {
                Text("닫기")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
            })
        }
        .frame(width: 300, height: 500, alignment: .center)
        .background(bgColor)
        .cornerRadius(10)
        .shadow(radius: 5, x: 5, y: 5 )
    }
    var body: some View {
        ZStack {
            VStack(spacing: 20){
                
                
                Button(action: {
                    self.showBottomSolidMessage = true
                }, label: {
                    Text("bottom solid message")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        
                })
                
                Button(action: {
                    self.showBottomToastMessage = true
                }, label: {
                    Text("bottom toast message")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        
                })
                
                Button(action: {
                    self.showTopSolidMessage = true
                }, label: {
                    Text("top solid message")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                })
                
                Button(action: {
                    self.showTopToastMessage = true
                }, label: {
                    Text("top toast message")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        
                })
                
                Button(action: {
                    self.showPopUpMessage = true
                }, label: {
                    Text("팝업 테스트")
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color(hexcode: "f6c9b7"))
                        .cornerRadius(10)
                        
                })
                
                
            }//vstack
        }//zstack
        .ignoresSafeArea(.all)
        .popup(isPresented: $showBottomSolidMessage, type: .toast, position: .bottom, animation: .default, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createSolidMessage(bgColor: Color.purple)
        })
        .popup(isPresented: $showBottomToastMessage, type: .floater(verticalPadding: 30), position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createToastMessage(bgColor: Color.green)
        })
        .popup(isPresented: $showTopSolidMessage, type: .toast, position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createSolidMessage(bgColor: Color.blue)
        })
        .popup(isPresented: $showTopToastMessage, type: .floater(verticalPadding: UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 0 : 70), position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createToastMessage(bgColor: Color.orange)
        })
        .popup(isPresented: $showPopUpMessage, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view: {
            self.createPopup(bgColor: Color(hexcode: "f6c9b7"))
        })
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
