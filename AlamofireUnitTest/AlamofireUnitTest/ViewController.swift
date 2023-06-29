//
//  ViewController.swift
//  AlamofireUnitTest
//
//  Created by leejungchul on 2023/02/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

//    let manager: URLSession
//    init(manager: URLSession = .shared) {
//        self.manager = manager
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(#function)
    }

    func getRecommendStoreList(closure : @escaping (Bool, [RecommendStoreData]?) -> Void) {
        
        let path = "http://59.6.99.141:8400/store/recommend"
        
        AF.request(path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" , method: .get)
            .responseDecodable(of: [RecommendStoreData].self) { response in
            switch response.result {
            case .success(let data) :
                print(#function, "SUCCESS")
                closure(true, data)
            case .failure(let error):
                print(#function, "FAILURE", error.localizedDescription)
                closure(false, nil)
            }
        }
    }

}

struct JokeModel: Codable {
    let created_at: Date
    let icon_url: String
    let id: String
    let updated_at: String
    let url: String
    let value: String
}

struct RecommendStoreData: Codable {
        
    var storeId: Int?
    var name: String?
    var businessType: String?
    
    var isWheelchair: Int?
    var isBabyCar: Int?
    var isDisabledToilet: Int?
    var isChildOk: Int?
    var isVoiceGuide: Int?
    var isParkingLot: Int?
    var isToilet: Int?
    
    var imageUrl: String?
    var favorites: Bool?
}
