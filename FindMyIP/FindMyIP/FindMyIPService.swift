//
//  FindIPService.swift
//  FindMyIP
//  Service
//  Created by 맥북에어 on 2020/12/11.
//

import Foundation

public class FindMyIPService:NSObject{
    
    var completionHandler: ((FindMyIP) -> Void)?
    
    public override init() {
        super.init()
        print("init Service")
        self.findMyIP()
    }
    
    
    public func loadIPData(_ completionHandler: @escaping ((FindMyIP) -> Void) ) {
        self.findMyIP()
        self.completionHandler = completionHandler
        print("completionHandler", completionHandler)
    }
    
    private func findMyIP() {
        let urlString = "http://date.jsontest.com/?service=ip"
        guard let url = URL(string: urlString) else { return }
        
        var urlReq: URLRequest = URLRequest.init(url: url)
        
        urlReq.httpMethod = "GET"
        urlReq.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        URLSession.shared.dataTask(with: urlReq){ data, response, error in
            guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(ResponseIP.self, from: data){
                print("json Response : ", response)
                self.completionHandler?(FindMyIP(response: response))
            }
        }.resume()
    }
    
    public func refresh(){
        self.findMyIP()
    }
}

struct ResponseIP: Decodable {
    var ip:String
}
