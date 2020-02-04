//
//  AnimUtil.swift
//  TRTabBar
//
//  Created by iMac on 2020. 2. 4..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class AnimUtil: NSObject, UITabBarControllerDelegate {

    //탭 메뉴 이동시 애니메이션 효과
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScrollingAnim(tabBarController: tabBarController)
    }
}

class ScrollingAnim: NSObject, UIViewControllerAnimatedTransitioning{
    weak var transitionContext: UIViewControllerContextTransitioning?
    var tabBarController: UITabBarController!
    var fromInex = 0
    init(tabBarController: UITabBarController){
        self.tabBarController = tabBarController
        self.fromInex = tabBarController.selectedIndex
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //뷰 만들어주기
        self.transitionContext = transitionContext
        let containerView = transitionContext.containerView
        
        //원래의 뷰
        
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        //추가 될 뷰
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        containerView.addSubview(toView!.view)
        
        var width = toView?.view.bounds.width
        
        // 현재 포지션과 새로들어온 포지션 비교
        // fromindex 기존값
        // tabBarController.selectedIndex 새로 들어온 값
        if tabBarController.selectedIndex < fromInex {
            width = -width!
        }
        
        toView!.view.transform = CGAffineTransform(translationX: width!, y: 0)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transitionContext)),animations: {
            //입력 되는 뷰
            toView?.view.transform = CGAffineTransform.identity
            fromView?.view.transform = CGAffineTransform(translationX: -width!, y: 0)
        }, completion: { _ in
            fromView?.view.transform = CGAffineTransform.identity
            self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
            
        })
    }
    
    //애니메이션 진행 속도
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
        
    }
}
