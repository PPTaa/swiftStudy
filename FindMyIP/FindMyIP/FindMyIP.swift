//
//  FindMyIP.swift
//  FindMyIP
//  Model
//  Created by 맥북에어 on 2020/12/11.
//

import Foundation

public struct FindMyIP {
    let ip: String
    
    init(response: ResponseIP) {
        ip = response.ip
    }
}
