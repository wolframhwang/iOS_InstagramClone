//
//  urlData.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/08/18.
//

import Foundation


struct urlData  {
    var mediaUrlId:Int?
    var type: String?
    var url: String?
    init() {
    }
    
    init(mediaUrlId:Int, type:String, url:String) {
        self.mediaUrlId = mediaUrlId
        self.type = type
        self.url = url
    }
}
