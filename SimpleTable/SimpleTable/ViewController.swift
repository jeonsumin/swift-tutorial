//
//  ViewController.swift
//  SimpleTable
//
//  Created by Sumin Jeon on 2020/01/19.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    @IBOutlet var tableView: UITableView!
    
    
    let cellIentifier: String = "cell"
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    
    let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        
        //self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        
    }
    
    
    //사용할 섹션을 지정하는 메소드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //row의 개수를 지정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    //row에 들어갈 데이터를 지정하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIentifier, for: indexPath)
        
        if indexPath.section < 2{
            let text : String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
        } else {
            //cell.textLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.textLabel?.text = "1"
        }
        return cell
    }

    //섹션의 이름을 지정해주는 메소드
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2{
            return section == 0 ? "한글" : (section == 2 ? "날짜" : "영어")
        }else {
            
        }
        return nil
    }
}

