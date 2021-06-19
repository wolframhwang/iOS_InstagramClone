//
//  signup.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation

struct SignUp : Codable{
    var displayId: String
    var email : String
    var nickname: String
    var password: String
    init(displayId: String, email: String, nickname: String, password: String) {
        self.displayId = displayId
        self.email = email
        self.nickname = nickname
        self.password = password
    }
}
