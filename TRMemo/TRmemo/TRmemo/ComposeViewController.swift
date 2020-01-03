//
//  ComposeViewController.swift
//  TRmemo
//
//  Created by Sumin Jeon on 2019/11/28.
//  Copyright © 2019 Sumin Jeon. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var memoTextView: UITextView!
    
    //dismiss > 모달창을 닫을때 사용
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: Any) {
        let memo = memoTextView.text
        
//        let newMemo = Memo(content: memo ?? "")
//        Memo.dummyMemoList.append(newMemo)
        DataManager.shared.addNewMemo(memo)
//
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
