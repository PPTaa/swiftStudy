//
//  SwiftUILayOutApp.swift
//  SwiftUILayOut
//
//  Created by 맥북에어 on 2020/12/04.
//

import SwiftUI

@main
struct SwiftUILayOutApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            MyGeoview()
//            MyTabView()
            CustomTabView(tabIndex: .home)
        }
    }
}
