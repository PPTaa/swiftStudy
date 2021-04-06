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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
        
        print("appear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiCall()
        print("load")
    }
    @IBAction func btnClick(_ sender: Any) {
//        cell.stationName.text = "aa"
//        apiCall()
        
        tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
        print("count : \(data0.count)")
        print("data : \(data0)")
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func apiCall() {
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
                } catch let error {
                    print(error.localizedDescription)
                }
                break
            case .failure(let error):
                print("error: \(error)")
                break
            }
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
