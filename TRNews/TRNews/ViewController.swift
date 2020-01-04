//
//  ViewController.swift
//  TRNews
//
//  Created by Sumin Jeon on 2020/01/04.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String,Any>>?
    //1. http 통신 방법
    //2. JSON 데이터 형식
    //3. 테이블 뷰의 데이터 매칭 <- 데이터 뿌리라고 통보! 후 그리기!
    //4. 네트워크 통신 원칙 !! background : network / ui : Main
    
    //뉴스 api 요청은 하루에 500회
    func getNews(){
        let tesk = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=a91fada3fb5a42f2a2d98f39499b5301")!) { (data, response, error) in
            if let dataJson = data{
                //json parsing
                do{
                    //swift에서 json은 dictionary로 동급으로 보고있음
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String,Any>
                    
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData() //Main
                    }
                    
                    //json 내용 확인 코드
                    //                    for(idx, value) in articles.enumerated() {
                    //                        if let v = value as? Dictionary<String,Any>{
                    //                            print("\(v["title"])")
                    //                        }
                    //                    }
                    //
                }catch{ }
            }
        }
        tesk.resume()
    }
    
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //뉴스의 개수 가져오기
        if let news = newsData{
            return news.count
        }else{
            return 0
        }
        
    }
    
    // 데이터가 무엇인지 반복 numberOfRowsInSection 숫자 만큼 반복
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //임의의 셀 만드는 방법
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        // 스토리보드 + id 방법
        // as? as! 타입을 안전하게 추론하는 as?와 강제로 변환하는 as! 부모 자식 간 확인
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        let idx =  indexPath.row
        if let news = newsData{
            
            let row = news[idx]
            if let r = row as? Dictionary<String,Any>{
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
        }
        
        return cell
    }
    
    //클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click!! >>> \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self == 자신 클래스 안의 함수들을 찾는다.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }
    
    
}

