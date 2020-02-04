//
//  ViewController.swift
//  TRScrollView
//
//  Created by iMac on 2020. 2. 4..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollVeiw: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let images = [#imageLiteral(resourceName: "bg1") ,#imageLiteral(resourceName: "bg2"), #imageLiteral(resourceName: "bg3")]
        
        for i in 0..<images.count{
            //이미지 아울렛에 assect에 있는 이미지를 대입
            let imageView = UIImageView()
            imageView.image = images[i]
            imageView.contentMode = .scaleAspectFit
            
            let xPosition = self.view.frame.width * CGFloat(i)
            
            //이미지를 x 축으로 붙임
            //첫번쨰 이미지 사이즈는 0,0 두번째 100,0 세번째 200,0 으로 정하여 x축으로 스크롤 할 수 있도록 이어 붙임
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            scrollVeiw.contentSize.width = self.view.frame.width * CGFloat(1+i)
            scrollVeiw.addSubview(imageView)
        }
        //한장한장씩 넘어가는것이아니라 스크롤이 생겨 스크롤이 생기는 것처럼 부드럽게 넘어가는데 storyboard에서 show the attribute instpactor 에서 scroll view 를 선택한 뒤 scrolling에 paging enable chacking 하면 한장한장씩 넘어가는 ui로 만들 수 있음 
    }

}

