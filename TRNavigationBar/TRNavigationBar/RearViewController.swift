//
//  RearViewController.swift
//  TRNavigationBar
//
//  Created by Terry on 2020/02/09.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class RearViewController :UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    let category = ["공지사항", "게시판", "사진"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//            이미지를 둥글게
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
//        테이블 값이 없을때 선 없애기
        tableView.tableFooterView = UIView()
        
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.name.text = category[indexPath.row]
        
        
        return cell
      }
    
//    segue를 이용해서 셀 클릭시 이동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationNavigation = segue.destination as! UINavigationController
        let destinationViewController = destinationNavigation.topViewController as! ViewController
        
        destinationViewController.positionValue = category[self.tableView.indexPathForSelectedRow!.row]
    }
      
}

class CustomCell : UITableViewCell{
    @IBOutlet weak var name: UILabel!
    
}
