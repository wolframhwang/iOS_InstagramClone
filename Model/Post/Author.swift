//
//  Author.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/08/18.
//

import Foundation


struct Author {
    var displayId: String?
    var followerCount: Int?
    var followingCount: Int?
    var introduction: String?
    var isFollowedByMe: Bool?
    var nickname: String?
    var postCount:Int?
    var profileImageUrl: String?
    init() {
       
    }
    
    init(displayId: String, followerCount: Int, followingCount: Int, introduction: String, isFollowdByMe: Bool, nickname: String,
         postCount: Int, profileImageUrl:String) {
        self.displayId = displayId
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.introduction = introduction
        self.isFollowedByMe = isFollowdByMe
        self.nickname = nickname
        self.postCount = postCount
        self.profileImageUrl = profileImageUrl
    }
}
