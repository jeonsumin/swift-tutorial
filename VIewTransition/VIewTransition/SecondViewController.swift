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
       // print("SecondViewController의 view 가 메로리에 로드됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController의 view가 화면에서 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController의 View가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondviewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondviewController의 view가 화면에서 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondviewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SecondviewController의 view가 subview를 레이아웃 함")
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
