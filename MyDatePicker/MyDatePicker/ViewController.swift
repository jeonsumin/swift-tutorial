//
//  ViewController.swift
//  MyDatePicker
//
//  Created by iMac on 2020. 1. 30..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    //시간 formatter 설정
    let dateFormatter: DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        //formatter 기본 제공 스타일
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        
        //사용자 지정 포멧형식 설정할 수 있음
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("value change")
        let date: Date = self.datePicker.date
        let dateString:String = self.dateFormatter.string(from:date)
        
        self.dateLabel.text = dateString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

