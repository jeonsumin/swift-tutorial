//
//  ViewController.swift
//  SimpleTable
//
//  Created by Terry on 2020/02/17.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
    //MARK: - PLC
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Identifier
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    //MARK: -Action
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        
//        self.tableView.reloadData()
        //Table View에 추가할때 애니메이션 추가
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    //dumy data
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    //데이터 저장 배열
    var dates: [Date] = []
    
    //date 포멧
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    //time 포멧
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    
    //MARK: - TableView 필수 메소드
    
    
    //테이블뷰의 섹션 개수 지정
       func numberOfSections(in tableView: UITableView) -> Int {
           return 3
       }
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2{
           return section == 0 ? "한글" : "영어"
        }
        
        return nil
          
       }
    
    //cell 개수
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
    
     //cell 데이터
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀 데이터 지정 > 더미데이터
        if indexPath.section < 2{

            //cell의 재사용 메소드 dequeueReusableCell >> 큐에 쌓여있던 셀을 재사용하는한 셀을 가져와서 사용
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
                  
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            
            cell.textLabel?.text = text

            if indexPath.row == 1 {
                cell.backgroundColor = UIColor.red
            } else {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }else{
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            return cell
        }
     }
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           // 세그가 여러개 일 경우 segue.identifier를 지정할 수 도 있음
           
           guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else{
               return
           }
           
           guard let cell: UITableViewCell = sender as? UITableViewCell else{
               return
           }
           
           nextViewController.textToSet = cell.textLabel?.text
        //프로퍼티에 세팅을 한다음에 값을 넘겨 주는 이유는 네이게이션 인스턴스는 생성이 되어있지만 뷰 데이터는 메모리에 올라가 있지 않은 상태이기 때문에 프로퍼티에 저장한 다음에 넘겨 주어야 한다.
        
        
       }
}

