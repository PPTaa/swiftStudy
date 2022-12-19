//
//  CodePresentViewController.swift
//  NeonSignApp
//
//  Created by leejungchul on 2021/11/17.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    //delegate변수 앞에는 weak를 붙여줘야함 아니면 메모리 누수가 일어남
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBackBtn(_ sender: Any) {
        self.delegate?.sendData(name: "SendDataProtcol")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
