//
//  FindMyIPApp.swift
//  FindMyIP
//
//  Created by 맥북에어 on 2020/12/11.
//

import SwiftUI

@main
struct FindMyIPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FindMyIPViewModel(findMyIPService: FindMyIPService()))
        }
    }
}
