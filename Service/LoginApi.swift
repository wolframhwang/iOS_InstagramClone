//
//  LoginApi.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import NSObject_Rx

class LoginApi : LoginApiType{
 
    private let login = "https://codevpros.com/auth/signin"
    
    func logCheck() {
        
    }
    func fetch(userInfo: UserInfo, onComplete: @escaping (Result<Data, Error>)->Void) {
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "email" : userInfo.email,
            "password" : userInfo.password
        ]
        AF.request("\(self.login)", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON() { response in
            switch response.result {
            case .success:
                onComplete(.success(response.data!))
                return
            case .failure(let error):
                onComplete(.failure(response.error!))
                return
            }
        }
        
    }
    
    
}
