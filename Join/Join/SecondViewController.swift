//
//  SecondViewController.swift
//  Join
//
//  Created by Terry on 2020/02/10.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - storyboard IBOutet
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var CheckPassword: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - didLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        ckeckPassword()
        // Do any additional setup after loading the view.
    }
    //MARK: - Action
    //단순한 입력폼, 단순한 팝업
      @IBAction func didmissModal(){
          self.dismiss(animated: true, completion: nil)
      }
    
    //MARK: - Func
    func ckeckPassword(){
        if self.password.text == self.CheckPassword.text {
            print("같음")
        }else{
            print("다름")
        }
        
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
