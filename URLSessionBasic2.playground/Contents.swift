import UIKit

// URLSession-2
// 1. URLSessionConfiguration
let config = URLSessionConfiguration.default
// 2. URLSession
let session = URLSession(configuration: config)
// 3. URLSessionTask 를 이용해서 서버와 네트워킹을 함

// URL
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "트와이스")

urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!

// 3-1. URLSessionDataTask
let dataTask = session.dataTask(with: requestURL) { (data, response, error ) in
    guard error == nil  else { return }
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // error코드가 전달될 경우 핸들링
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
//    print("resultData : \(resultData)")
//    print("resultString : \(resultString)")
    
    // 가져온 Data 활용하기
    // 1) Data 를 Track목록으로 가져오기 [Track]
    // 2) Track 오브젝트를 만들기
    // 3) Data에서 struct로 파싱 > Codable 활용
    // 3-1) Json파일, 데이터를 오브젝트로 만들기
    // 3-2) Response, Track 두개로 제작
    
    // Response, Track Struct 제작
    // struct의 프로퍼티 이름과 실제 데이터의 키와 맞추기 (codable 디코딩하기 위함)
    // ============== 아래에서 스트럭트 구성함
    // 파싱하기 (Decoding)
    // 트랙리스트 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        for i in 0..<tracks.count {
            print("tracks idx : \(i)")
            print("tracks title : \(tracks[i].title)")
            print("tracks artistName : \(tracks[i].artistName)")
            print("tracks thumbnailPath : \(tracks[i].thumbnailPath)")
            
        }
    } catch let error {
        print("error : \(error.localizedDescription)")
    }
    
    
}
dataTask.resume() // dataTask를 실행시킴

// URLSessionUploadTask
// URLSessionDownloadTask


//struct작성
struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}
struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    // 실제 넘어오는 데이터와 이름을 맞추기위함
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}
