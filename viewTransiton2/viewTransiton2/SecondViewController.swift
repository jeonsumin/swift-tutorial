//
//  SecondViewController.swift
//  viewTransiton2
//
//  Created by iMac on 2020. 1. 30..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    
    @IBAction func pushandpop2() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didmissmodal(){
        self.dismiss(animated: true, completion: nil)
    }
}
