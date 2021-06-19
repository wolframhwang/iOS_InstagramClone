//
//  SignUpType.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation
import RxSwift

protocol SignUpType {
    func fetch(signup: SignUp,onComplete: @escaping (Result<Data, Error>)->Void)
}
