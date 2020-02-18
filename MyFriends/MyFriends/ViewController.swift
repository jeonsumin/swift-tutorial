//
//  ViewController.swift
//  MyFriends
//
//  Created by Terry on 2020/02/18.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        //코드 간단하게 하기위해서 Friend.swift 프로퍼티에서 설정 
//        cell.textLabel?.text = friend.name + "(\(friend.age))"
//        cell.detailTextLabel?.text = friend.address_info.city + "," + friend.address_info.country

        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
                
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //JSONDecoder
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name:"friends") else {
            return
        }
      
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
            print(dataAsset)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
}

