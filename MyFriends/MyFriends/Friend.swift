//
//  Friend.swift
//  MyFriends
//
//  Created by Terry on 2020/02/18.
//  Copyright © 2020 Terry. All rights reserved.
//

import Foundation

struct Friend:Codable {
    
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    
    //프로퍼티에서 뿌려줄 내용을 변수에 넣어서 간편하게 호출 할 수 있도록 설정 
    var nameAndAge: String{
        return self.name + "(\(self.age))"
    }
    
    var fullAddress: String{
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
    
    //JSON Key 값과 프로퍼티 명과 같게 해주는 코드
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}
