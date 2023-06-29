//
//  ApiTest.swift
//  AlamofireUnitTest
//
//  Created by leejungchul on 2023/02/21.
//
import Foundation
import Alamofire

final class ApiTest {
    
    private let session: Session
    init(session: Session = Session.default) {
        self.session = session
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
