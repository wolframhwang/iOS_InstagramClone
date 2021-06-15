//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/15.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    @IBOutlet weak var DisplayID: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var password: UITextField!
    private var isCheck = false
    @IBAction func dismissButton(_ sender: Any) {
        up()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

struct signup : Codable{
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

extension SignUpViewController {
    func up() {
        let URL = "https://codevpros.com/auth/signup"
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "email" : self.email.text,
            "password" : self.password.text
        ]
        
        let data: signup = signup(displayId: self.DisplayID.text!, email: self.email.text!, nickname: self.nickName.text!, password: self.password.text!)
        let request = AF.request("\(URL)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
        request.validate(statusCode: 200..<500)
            .responseDecodable(of: SimpleResponse<String>.self) {response in
                switch response.result {
                case .success:
                    print(response.response?.statusCode)
                    self.dismiss(animated: true, completion: nil)
                case .failure(let err):
                    return
                }
            }
    }
}
