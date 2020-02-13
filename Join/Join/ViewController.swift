//
//  ViewController.swift
//  Join
//
//  Created by Terry on 2020/02/10.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("view did Load")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
               self.id.text = UserInformation.shared.id
         }

}

