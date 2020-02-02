//
//  UserDTO.swift
//  TRTableView
//
//  Created by iMac on 2020. 2. 2..
//  Copyright © 2020년 iMac. All rights reserved.
//

class UserDTO {
    var image : String!
    var name : String!
    var message: String!
    
    init(image: String, name: String, message: String) {
        self.image = image
        self.name = name
        self.message = message
    }
}
