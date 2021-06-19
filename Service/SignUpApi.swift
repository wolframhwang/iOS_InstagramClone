//
//  SignUpApi.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import NSObject_Rx

class SignUpApi: SignUpType {
    private let login = "https://codevpros.com/auth/signup"
    
    func fetch(signup: SignUp, onComplete: @escaping (Result<Data, Error>) -> Void) {
        
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "displayId": signup.displayId,
            "email" : signup.email,
            "nickname" :signup.nickname,
            "password" : signup.password
        ]
        print(parameters)
        AF.request("\(self.login)", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON() { response in
            let statusCode = Int(response.response!.statusCode)
            switch statusCode {
            case 200..<300:
                onComplete(.success(response.data!))
                return
            default:
                onComplete(.failure(response.error!))
                return
            }
        }
    }
        
}

