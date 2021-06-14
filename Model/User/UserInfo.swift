//
//  UserInfo.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/15.
//

import Foundation


struct UserInfo: Codable {
    var email : String
    var password : String
    init(email : String, password: String) {
        self.email = email
        self.password = password
    }
}
