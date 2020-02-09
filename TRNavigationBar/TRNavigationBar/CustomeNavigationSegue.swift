//
//  CustomeNavigationSegue.swift
//  TRNavigationBar
//
//  Created by Terry on 2020/02/09.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class CustomeNavigationSegue: UIStoryboardSegue{
    override func perform() {
        
        let viewController:ViewController = self.source as! ViewController
        
        //스토리보드에서 화면이 바뀔 화면
        let destinationController: UIViewController = self.destination
        
//        이전 뷰 날리는 코드
        for view in (viewController.frameView.subviews){
            view.removeFromSuperview()
        }
        
//        넘겨주기
        let childView: UIView = destination.view
        viewController.currentViewController = destinationController
        viewController.frameView.addSubview(childView)
        
//        크기조정
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        childView.topAnchor.constraint(equalTo: viewController.frameView.topAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: viewController.frameView.bottomAnchor).isActive = true
        childView.leftAnchor.constraint(equalTo: viewController.frameView.leftAnchor).isActive = true
        childView.rightAnchor.constraint(equalTo: viewController.frameView.rightAnchor).isActive = true
        
//        새로고침
        viewController.frameView.layoutIfNeeded()
        
    }
}
