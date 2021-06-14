//
//  ViewController.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/12.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func LogIn(_ sender: Any) {
        let URL = "https://codevpros.com/auth/signin"
        let API = API()
        let data : UserInfo = UserInfo(email: email.text ?? "", password: password.text ?? "")
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "email" : self.email.text,
            "password" : self.password.text
        ]
        print(parameters)
        let request = AF.request("\(URL)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
        request.validate(statusCode: 200..<500)
            .responseDecodable(of: SimpleResponse<String>.self) {response in
                switch response.result {
                case .success:
                    print(response.response?.statusCode)
                case .failure(let err):
                    return
                }
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        keyCheck()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    // 지금 이전 로그인 정보가 저장이 되어 있는가?
    func keyCheck() -> Bool {
        let key = keyChain()
        guard let readResult = key.read("codev", account: "loginData") else {
            return false
        }
        // Loga Data 정보에 담기는것을 생각해보면
        // ID + 비밀 번호 + Token + expire + grantType + refreshToken!
        // 한번에 넣을꺼임!
        let LogData = readResult.split(separator: " ")
        let expire = Int(LogData[2]) ?? 0
        let now = Int(Date().timeIntervalSince1970 * 1000) ?? 0
        if now > expire { // expire
            
        }
        return true
    }
}

