//
//  ThirdViewController.swift
//  Join
//
//  Created by Terry on 2020/02/10.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DatePicker: UIDatePicker!
    //시간 formatter 설정
        let dateFormatter: DateFormatter = {
            let formatter:DateFormatter = DateFormatter()
            //formatter 기본 제공 스타일
    //        formatter.dateStyle = .medium
    //        formatter.timeStyle = .medium
            
            //사용자 지정 포멧형식 설정할 수 있음
            formatter.dateFormat = "yyyy.MM.dd"
            return formatter
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let selectDate = DatePicker.date
        
        let dateString:String = self.dateFormatter.string(from: selectDate)
        
        self.DateLabel.text = dateString
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker){
        print("date chage")
        //선택한 날짜 가져오기
        let selectDate = DatePicker.date
        
        let dateString:String = self.dateFormatter.string(from: selectDate)
        
        self.DateLabel.text = dateString
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){ self.navigationController?.popToRootViewController(animated: true)
       }
  
    //단순한 입력폼, 단순한 팝업

    @IBAction func popToPrev(){
           self.navigationController?.popViewController(animated: true)
       }
    
    @IBAction func moveMain(_ sender: Any){

        self.navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
