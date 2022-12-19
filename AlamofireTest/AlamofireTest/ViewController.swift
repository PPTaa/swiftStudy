//
//  ViewController.swift
//  AlamofireTest
//
//  Created by leejungchul on 2021/04/06.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var data0: [[String]] = []
    
    let semaphore = DispatchSemaphore(value: 0)
    
    var tmapPara:Parameters = [
        "version" : "1",
        "format" : "json",
        "callback" : "result",
        "appKey":"l7xx98d2ab7920cb4d80ae85d92e7772a4b5",
        "startX" : "126.97871544",
        "startY" : "37.56689860",
        "endX" : "127.00160213",
        "endY" : "37.57081522",
        "startName" : "출발지",
        "endName" : "도착지"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("appear")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        apiCall()
        print("load")
    }
    @IBAction func btnClick(_ sender: Any) {
//        cell.stationName.text = "aa"
        print("btn click 1")
        apiCall()
        print("btn click 2")
//        self.tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
        print("count : \(data0.count)")
        print("data : \(data0)")
    }
    @IBAction func tmapBtnClick(_ sender: Any) {
        tmapApiCall()
    }
    @IBOutlet weak var tableView: UITableView!
    
    func reloadTableView(){
        tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
    }
    @IBAction func railportalBtnClick(_ sender: Any) {
        railportalApiCall()
    }
    
    func apiCall() {
        print("apicall start")
        AF.request("http://openapi.seoul.go.kr:8088/sample/json/bikeList/1/5/").responseJSON { response in
            switch response.result {
            case .success(let data) :
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    print("jsonData : \(jsonData)")
                    let getData = try JSONDecoder().decode(Root.self, from: jsonData)
                    print("data : \(getData.rentBikeStatus.row)")
                    for i in getData.rentBikeStatus.row {
                        print(i.stationName)
                        print(i.X, i.Y)
                        self.data0.append([i.stationName, i.parkingBikeTotCnt, i.stationLongitude, i.stationLatitude])
                    }
                    DispatchQueue.main.async {
                        self.reloadTableView()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                break
            case .failure(let error):
                print("error: \(error)")
                break
            }
            print("apicall end")
        }
    }
    
    func tmapApiCall() {
        print("tmapApiCall start")
        AF.request("https://apis.openapi.sk.com/tmap/routes/pedestrian", parameters: tmapPara, encoding: URLEncoding.queryString).responseJSON { response in
            switch response.result {
            case .success(let data) :
                print(data)
                break
            case .failure(let error):
                print("error: \(error)")
                break
            }
            print("tmapApiCall end")
        }
    }
    
    func railportalApiCall() {
        print("railportalApiCall start")
        AF.request("http://openapi.kric.go.kr/openapi/handicapped/stationMovement?serviceKey=$2a$10$ZDm3qlChvBbhPNxay20fHe6DxH/lr0m3AzoygqkMTrHUYU1nFgvtq&format=json&railOprIsttCd=S1&lnCd=3&stinCd=322&nextStinCd=323", parameters: tmapPara, encoding: URLEncoding.queryString).responseJSON { response in
            switch response.result {
            case .success(let data) :
                print(data)
                break
            case .failure(let error):
                print("error: \(error)")
                break
            }
            print("railportalApiCall end")
        }
    }
}

struct Root:Codable {
    let rentBikeStatus: RentBikeStatus
}

struct RentBikeStatus: Codable {
    let RESULT: Result
    let row: [Row]
}

struct Result: Codable {
    let CODE: String
    let MESSAGE: String
}

struct Row: Codable {
    let parkingBikeTotCnt: String
    let rackTotCnt: String
//    let stationId: String
    let stationLatitude: String
    let stationLongitude: String
    let stationName: String
    
    var X: Double {
        return Double(stationLatitude)!
    }
    var Y: Double {
        return Double(stationLongitude)!
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data0.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.stationName.text = "Station Name : \(data0[indexPath.row][0])"
        cell.parkingBikeToCnt.text = "Parking Bike Count : \(data0[indexPath.row][1])"
        cell.stationXY.text = "Station XY : \(data0[indexPath.row][3]) , \(data0[indexPath.row][2])"
        
        return cell
        
    }
    
    
}


class CustomCell: UITableViewCell {
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var parkingBikeToCnt: UILabel!
    @IBOutlet weak var stationXY: UILabel!
    
}
