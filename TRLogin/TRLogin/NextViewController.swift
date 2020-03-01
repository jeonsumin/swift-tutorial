//
//  NextViewController.swift
//  TRLogin
//
//  Created by Terry on 2020/03/01.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    
    var receiveStr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = receiveStr
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
