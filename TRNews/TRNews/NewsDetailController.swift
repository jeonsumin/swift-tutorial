//
//  NewDetailController.swift
//  TRNews
//
//  Created by Sumin Jeon on 2020/01/04.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit

class NewsDetailController : UIViewController{
    
    @IBOutlet var imageMain: UIImageView!
    @IBOutlet var labelMain: UILabel!
    
    //1. image URL >> 이미지URL을 통해 이미지 보여주기
    //2. desc >> 뉴스 본문 보여주기
    
    var imageUrl: String?
    var desc: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ok?
        if let img = imageUrl{
            //이미지를 가져와서 뿌린다.
            if let data = try? Data(contentsOf: URL(string: "img" )!){
                //Main Thread
                DispatchQueue.main.async {
                    self.imageMain.image = UIImage(data: data)
                }
                
            }
        }
        
        if let d = desc{
            // 뉴스 본문을 보여준다.
            self.labelMain.text = d
        }
    }
}
