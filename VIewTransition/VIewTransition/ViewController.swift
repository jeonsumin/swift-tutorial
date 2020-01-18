//
//  ViewController.swift
//  VIewTransition
//
//  Created by Sumin Jeon on 2020/01/18.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //프로젝트 생성시 기본적으로 설정되어있는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController의 view 가 메로리에 로드됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController의 view가 화면에서 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController의 View가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewController의 view가 화면에서 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewController의 view가 subview를 레이아웃 함")
    }
}

