//
//  API.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/14.
//

import Foundation
import Alamofire

class API {
    let baseURL = "https://codevpros.com/"
    
//    func get1(completionHandler: @escaping (Result<[UserData], Error>) -> Void) {
//        self.request = AF.request("\(self.baseURL)/posts")
//                        .responseDecodable { (response: DataResponse<[UserData]>) in
//                            switch response.result {
//                            case .success(let userDatas):
//                                completionHandler(.success(userDatas))
//                            case .failure(let error):
//                                completionHandler(.failure(error))
//                            }
//                        }
//    }
    
    func post(data : UserInfo) {
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "email" : data.email,
            "password" : data.password
        ]
        let request = AF.request("\(self.baseURL)/signin", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
        request.validate(statusCode: 200..<500)
            .responseDecodable(of: SimpleResponse<String>.self) {response in
                switch response.result {
                case .success:
                    print(response.value)
                    print(response.value?.message)
                case .failure(let err):
                    print(err)
                }
                
            }
        
    }
    
//    func put(completionHandler: @escaping (Result<[UserData], Error>) -> Void) {
//        let userData = PostUserData(id: 1)
//        self.request = AF.request("\(Config.baseURL)/posts/1", method: .put, parameters: userData)
//                        .responseDecodable { (response: DataResponse<PostUserData>) in
//                            switch response.result {
//                            case .success(let userData):
//                                completionHandler(.success([userData.toUserData()]))
//                            case .failure(let error):
//                                completionHandler(.failure(error))
//                            }
//                        }
//    }
//
//    func patch(completionHandler: @escaping (Result<[UserData], Error>) -> Void) {
//        let userData = PostUserData(id: 1)
//        self.request = AF.request("\(Config.baseURL)/posts/1", method: .patch, parameters: userData)
//                        .responseDecodable { (response: DataResponse<PatchUserData>) in
//                            switch response.result {
//                            case .success(let userData):
//                                completionHandler(.success([userData.toUserData()]))
//                            case .failure(let error):
//                                completionHandler(.failure(error))
//                            }
//                        }
//    }
//
//    func delete(completionHandler: @escaping (Result<[UserData], Error>) -> Void) {
//        self.request = AF.request("\(Config.baseURL)/posts/1", method: .delete)
//                        .response { response in
//                            switch response.result {
//                            case .success:
//                                completionHandler(.success([UserData(userId: -1, id: -1, title: "DELETE", body: "SUCCESS")]))
//                            case .failure(let error):
//                                completionHandler(.failure(error))
//                            }
//                        }
//    }
}

struct SimpleResponse<T: Codable>: Codable {
    let statusCode: Int?
    let message: String?
    let data: T?
    enum CodingKeys: CodingKey {
        case statusCode,
             message,
             data
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? nil
        message = (try? values.decode(String.self, forKey: .message)) ?? nil
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}

