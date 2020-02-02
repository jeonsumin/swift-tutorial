//
//  ViewController.swift
//  TRTableView
//
//  Created by iMac on 2020. 2. 2..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var Users = [UserDTO]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //행개수
        return Users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //각각의 행에 디자인하는 부분
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath ) as! CustomCell
        
        cell.profileImage.image = UIImage(named: Users[indexPath.row].image)
        cell.profileImage.layer.cornerRadius = (cell.profileImage.frame.width)/2
        cell.profileImage.layer.masksToBounds = true
        cell.profileName.text = Users[indexPath.row].name
        cell.profileMessage.text = Users[indexPath.row].message
        
        cell.bubleSpeech.translatesAutoresizingMaskIntoConstraints = false
        cell.bubleSpeech.leftAnchor.constraint(equalTo: cell.profileMessage.leftAnchor, constant: -10).isActive = true
        cell.bubleSpeech.topAnchor.constraint(equalTo: cell.profileMessage.topAnchor, constant: -10).isActive = true
        cell.bubleSpeech.rightAnchor.constraint(equalTo: cell.profileMessage.rightAnchor, constant: 10).isActive = true
        cell.bubleSpeech.bottomAnchor.constraint(equalTo: cell.profileMessage.bottomAnchor, constant: 10).isActive = true
        cell.bubleSpeech.layer.cornerRadius = 10
        cell.bubleSpeech.layer.masksToBounds = true
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Users.append(UserDTO(image: "first",name: "전수민",message: "오늘 어플 개발 힘듦"))
        Users.append(UserDTO(image: "second",name: "안우진",message: "찡찡"))
        Users.append(UserDTO(image: "first",name: "인동환",message: "똘추"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CustomCell: UITableViewCell{
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileMessage: UILabel!
    @IBOutlet weak var bubleSpeech: UIView!
    
    
}
