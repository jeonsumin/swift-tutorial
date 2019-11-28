//
//  Model.swift
//  TRmemo
//
//  Created by Sumin Jeon on 2019/11/28.
//  Copyright © 2019 Sumin Jeon. All rights reserved.
//

import Foundation


class Memo{
    var content: String
    var insertDate: Date
    
    init(content:String){
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "DolA met")
    ]
}
