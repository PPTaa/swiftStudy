//
//  SeguePresentViewController.swift
//  NeonSignApp
//
//  Created by leejungchul on 2021/11/17.
//

import UIKit

class SeguePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapBackBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
