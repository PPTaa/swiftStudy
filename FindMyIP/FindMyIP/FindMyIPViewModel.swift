//
//  FindMyIPViewModel.swift
//  FindMyIP
//  ViewModels
//  Created by 맥북에어 on 2020/12/11.
//

import Foundation

public class FindMyIPViewModel: ObservableObject {
    @Published var ip: String = "find My ip"
    
    public let findMyIPService: FindMyIPService
    
    public init(findMyIPService: FindMyIPService) {
        print("viewModel init")
        self.findMyIPService = findMyIPService
        findMyIPService.loadIPData{data in
            DispatchQueue.main.async {
                self.ip = data.ip
            }
        }
    }
    
    public func refresh(){
        print("refresh")
        findMyIPService.loadIPData{data in
            DispatchQueue.main.async {
                self.ip = data.ip
            }
        }
    }
}
    
    
//    public func refresh() {
//        print("refresh VM")
//        findMyIPService.loadIPData{ip in
//            DispatchQueue.main.async {
//                self.ip = ip.ip
//            }
//        }
//    }

