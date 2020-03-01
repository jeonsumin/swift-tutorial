//
//  ViewController.swift
//  TRLogin
//
//  Created by Terry on 2020/03/01.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    
    
    @IBAction func login(_ sender: Any) {
        if(password.text == "1234"){
            performSegue(withIdentifier: "login", sender: nil)
        }else{
            let alert = UIAlertController(title: "아이디 확인", message: "비밀번호가 맞지 않습니다.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "login"){
            let nextVC:NextViewController = segue.destination as! NextViewController
            nextVC.receiveStr = id.text! + "님이 로그인 하셨습니다."
        }
    }
}

