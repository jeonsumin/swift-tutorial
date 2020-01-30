//
//  UserInformation.swift
//  viewTransiton2
//
//  Created by iMac on 2020. 1. 30..
//  Copyright © 2020년 iMac. All rights reserved.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation() //type 프로퍼티
    
    //type프로퍼티를 호출하면 항상 같은 값을 호출할 수 있다.
    
    var name: String?
    var age : String?
    
}
