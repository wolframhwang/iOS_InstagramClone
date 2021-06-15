//
//  RefreshToken.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/15.
//

import Foundation


struct Refresh: Codable {
    let token: String
    let refresh : String
    init(token: String, refresh: String) {
        self.token = token
        self.refresh = refresh
    }
}
