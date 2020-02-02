//
//  ViewController.swift
//  TestAPI
//
//  Created by iMac on 2020. 1. 31..
//  Copyright © 2020년 iMac. All rights reserved.
//
//  Http허용 및 nodeJS를 사용하여 만든 로컬 REST-API 통신 예제
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        //https가 아닌 http 를 사용하기 위해서는 Info.plist 파일에서 App Transport Security Settings를 추가하고 하위에 Allow Arbitrary Loads에 YES를 넣어주어서 설정값을 변경해야한다.
        let tesk = URLSession.shared.dataTask(with: URL(string:"http://localhost:3000/test")!) { (data, response, error) in //URL통신하기 위한 URLSession 사용
            if let dataJson = data {
                
                //json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String,Any> //json형식 heanding하기
                    print("json : \(json["status"]!)")
                    if json["status"]! as! String  == "ok"{
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    print(articles)
                    for (_,value) in articles.enumerated() {
                        if let v = value as? Dictionary<String,Any>{
                            print("\(v["name"]!)")
                            
                        }
                    }
                    }
                }catch{
                    print(error)
                }
            }
        }
        tesk.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
        // Dispose of any resources that can be recreated.
    }


}

