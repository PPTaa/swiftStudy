//
//  ContentView.swift
//  FindMyIP
//
//  Created by 맥북에어 on 2020/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: FindMyIPViewModel
    
    @State var refresh: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Your IP is")
            Text(viewModel.ip)
                .font(.system(.largeTitle))
                .padding()
            Spacer()
            Button(action: {
                self.refresh.toggle()
                viewModel.refresh()
                print("toggle", viewModel.ip)
            }
                   , label: {
                Text("refresh")
            })
            if refresh {
                Text("refresh : \(String(refresh)) " + viewModel.ip)
                    .lineLimit(nil)
            
            } else {
                Text("refresh : \(String(refresh)) " + viewModel.ip)
                    .lineLimit(nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FindMyIPViewModel(findMyIPService: FindMyIPService()))
    }
}
