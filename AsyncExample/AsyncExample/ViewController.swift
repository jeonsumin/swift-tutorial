//
//  ViewController.swift
//  AsyncExample
//
//  Created by Terry on 2020/04/02.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton){
        //이미지 다운로드 -> 이미지뷰에 세팅
        
        
        //https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Pleiades_large.jpg/1600px-Pleiades_large.jpg
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Pleiades_large.jpg/1600px-Pleiades_large.jpg")!
        
        OperationQueue().addOperation {
            //백그라운드에서 비동기 실행 ㄱ
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            //실행시 경고문구
            
            /*
            self.imageView.image = image
             UIImageView.image must be used from main thread only
             메인스레드에서 실행해야 한다는 경고 메세지 발생
             */
            //동기 프로그램을 개발할때 사용할 수 있는 OperationQueue를 사용 할 수 있음
            //self.imageView.image = image >>this line은 메인스레이드에서 실행해야 하므로 ~.main.addOperation을 통해 메인스레드로
            //인식시켜 렌더링 할 수 있도록 한다.
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

