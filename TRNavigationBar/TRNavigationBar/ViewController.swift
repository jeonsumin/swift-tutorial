//
//  ViewController.swift
//  TRNavigationBar
//
//  Created by Terry on 2020/02/09.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func NavigationbuttonRight(_ sender: Any) {
        let alert = UIAlertController(title: "Mail", message: "도착한 메시지가 없습니다.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert,animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

