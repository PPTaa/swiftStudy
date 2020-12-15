//
//  ContentView.swift
//  FindMyIP
//
//  Created by 맥북에어 on 2020/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: FindMyIPViewModel
    
    var body: some View {
        Text(viewModel.ip)
            .font(.system(.largeTitle))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FindMyIPViewModel(findMyIPService: FindMyIPService()))
    }
}
