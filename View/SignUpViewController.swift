//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/15.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import NSObject_Rx


class SignUpViewController: UIViewController, ViewModelBindableType {
    var viewModel : SignUpViewModel!
    @IBOutlet weak var displayId: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    func bindViewModel() {
        self.signUp.rx.tap.subscribe() {_ in
            let signup = SignUp(displayId: self.displayId.text ?? "", email: self.email.text ?? "", nickname: self.nickname.text ?? "", password: self.password.text ?? "")
            let api = SignUpApi()
            api.fetch(signup: signup, onComplete: { result in
                switch result {
                case .success(let data):
                    self.viewModel.go()
                    break
                case .failure(let err):
                    print("FUCK")
                    print(err)
                    break
                }
            })
            
        }.disposed(by: rx.disposeBag)
        //signUp.rx.action = viewModel.signupAction
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

/*extension SignUpViewController {
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
*/
