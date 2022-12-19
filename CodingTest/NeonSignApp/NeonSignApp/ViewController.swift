//
//  ViewController.swift
//  NeonSignApp
//
//  Created by leejungchul on 2021/11/17.
//

import UIKit


class ViewController: UIViewController, SendDataDelegate {
    
    // 델리게이트 패턴을 활용하여 데이터 전달 다음시간에 계속!!!! 중요!!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func codePushBtn(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else { return }
        vc.name = "codePushBtnTest"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapCodePresentBtn(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else { return }
        vc.name = "codePushBtnTest"
        vc.delegate = self
        
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SeguePushViewController else {return}
        vc.name = "SeguePushViewController"
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

