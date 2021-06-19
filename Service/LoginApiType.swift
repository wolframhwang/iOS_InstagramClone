//
//  LoginApiType.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation
import RxSwift

protocol LoginApiType {
    func logCheck()
    func fetch(userInfo: UserInfo,onComplete: @escaping (Result<Data, Error>)->Void)
}
