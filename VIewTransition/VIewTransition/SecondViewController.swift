//
//  SecondViewController.swift
//  VIewTransition
//
//  Created by Sumin Jeon on 2020/01/18.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //정보의 흐름을 가지고 있을때 push and pop 을 사용
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }

    //단순한 입력폼, 단순한 팝업
    @IBAction func didmissModal(){
        self.dismiss(animated: true, completion: nil)
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
