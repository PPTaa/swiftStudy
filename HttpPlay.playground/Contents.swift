//: A UIKit based Playground for presenting user interface
  
import UIKit
import Foundation
import PlaygroundSupport

class MyViewController : UIViewController {
    
    struct Person: Decodable{
        var name: String
//        var age: Int
        var birthDate: String
        var address: String?
    }

    let jsonData =
    """
    {
    "name": "Tom",
    "age": 15,
    "birthDate": "2019-04-29T01:30:00Z",
    "address": "동대문구 답십리",
    }
    """.data(using: .utf8)!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(Person.self, from: jsonData)
            print("success")
            print(result)
        } catch {
            print("error")
            print(error)
        }
       
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



