//
//  UserInfomation.swift
//  Join
//
//  Created by Terry on 2020/02/12.
//  Copyright © 2020 Terry. All rights reserved.
//


import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation() //type 프로퍼티
    
    //type프로퍼티를 호출하면 항상 같은 값을 호출할 수 있다.
    
    var id: String?
    var password : String?
    //var info : String?
    
}
