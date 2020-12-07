//
//  CustomTabView.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/07.
//

import SwiftUI

enum TabIndex {
    case home, cart, profile
}

struct CustomTabView:View {
    
    @State
    var tabIndex:TabIndex
    
    @State
    var largerScale: CGFloat = 1.5
    
    func changeMyView(tabIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .home:
            return MyView(content: "HOME", bgcolor: Color.green)
        case .cart:
            return MyView(content: "CART", bgcolor: Color.orange)
        case .profile:
            return MyView(content: "PROFILE", bgcolor: Color.yellow)
        default:
            return MyView(content: "HOME", bgcolor: Color.green)
        }
    }
    
    func changeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return Color.green
        case .cart:
            return Color.orange
        case .profile:
            return Color.yellow
        default:
            return Color.green
        }
    }
    
    func calcCircleBgPosition(tabIndex: TabIndex, geo: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return 0
        case .cart:
            return -(geo.size.width/3)
        case .profile:
            return geo.size.width/3
        default:
            return 0
        }
    }
    
    var body: some View{
//        Text("CustomTabView")
        GeometryReader{ geo in
            ZStack(alignment: .bottom){
                self.changeMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .frame(width:100, height: 100)
                    .foregroundColor(.white)
//                    .offset(x: geo.size.width/3)
                    .offset(x: self.calcCircleBgPosition(tabIndex: self.tabIndex, geo: geo), y:UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? -10 : -30)
                
                HStack(spacing:0){
                    Button(action: {
                        print("cart click")
                        withAnimation{
                            self.tabIndex = .cart
                        }
                    }){
                        Image(systemName: "cart")
                            .font(.system(size: 40))
                            .scaleEffect(self.tabIndex == .cart ? self.largerScale: 1)
                            .foregroundColor(self.tabIndex == .cart ? self.changeIconColor(tabIndex: self.tabIndex): Color.secondary)
                            .frame(width: geo.size.width/3, height: 80)
                            .offset(y: self.tabIndex == .cart ? -10: 0)
                    }.background(Color.white)
                    
                    Button(action: {
                        print("home click")
                        withAnimation{
                            self.tabIndex = .home
                        }
                    }){
                        Image(systemName: "homekit")
                            .font(.system(size: 40))
                            .scaleEffect(self.tabIndex == .home ? self.largerScale: 1)
                            .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex): Color.secondary)
                            .frame(width: geo.size.width/3, height: 80)
                            .offset(y: self.tabIndex == .home ? -10: 0)
                    }.background(Color.white)
                    
                    Button(action: {
                        print("profile click")
                        withAnimation{
                            self.tabIndex = .profile
                        }
                    }){
                        Image(systemName: "person")
                            .font(.system(size: 40))
                            .scaleEffect(self.tabIndex == .profile ? self.largerScale: 1)
                            .foregroundColor(self.tabIndex == .profile ? self.changeIconColor(tabIndex: self.tabIndex): Color.secondary)
                            .frame(width: geo.size.width/3, height: 80)
                            .offset(y: self.tabIndex == .profile ? -10: 0)
                    }.background(Color.white)
                    
                }//hstack
                // 아이폰 기종별 처리
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                .background(Color.white)
                
            }//zstack
        }// geo
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .home)
    }
}
