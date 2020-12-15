//
//  WeatherService.swift
//  WeatherMVVM
//
//  Created by 맥북에어 on 2020/12/10.
//

import CoreLocation
import Foundation

public final class WeatherService: NSObject {
    
    //위치정보 가져오는 부분
    private let locationManager = CLLocationManager()
    //openweathermap API_KEY
    private let API_KET = "744e090a0436c332fa103837116cd0b7"
    //
    private var completionHandler: ((Weather) -> Void)?
    
    public override init() {
        super.init()
        // delegate에 따라 사용자 지정개체를 속성에 할당
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping ((Weather) -> Void) ) {
        self.completionHandler = completionHandler
        // 위치정보 사용 요청 및 승인
        locationManager.requestWhenInUseAuthorization()
        // locationManager 시작하기
        locationManager.startUpdatingLocation()
    }
    
    
    // https:api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D){
        // 주소에 한글이나 스페이스가 들어가게되면 url이 nil이 될 수 있어 인코딩으로 방지
        guard let urlString = "https:api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KET)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        print("url : ",url)
        //http 통신을 할때 사용함
        URLSession.shared.dataTask(with: url) { data, response, error in
            // url의 데이터응답이
            guard error == nil, let data = data else { return }
            // 응답온 json 양식을 decoding 해서 원하는 것만 APIResponse struct 에서 받음
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                print("Response",response)
                self.completionHandler?(Weather(response: response))
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate{
    public func locationManager(
        _ manager: CLLocationManager,
        // 새 위치데이터를 사용할 수 있음을 알림
        didUpdateLocations locations: [CLLocation]
    ) {
        // unwrapping
        guard let location = locations.first else { return }
        // CLLocation의 지리적 좌표정보 가져옴
        print(type(of: location.coordinate))
        makeDataRequest(forCoordinates: location.coordinate)
    }
    
    public func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("오류가 났어용 : \(error.localizedDescription)")
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}


struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    // API에서 호출되는 키 네임과 내가 지정하고 싶은 키 네임이 다를때 맞춰주는 것
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
    
}
