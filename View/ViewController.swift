//
//  ViewController.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/12.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController, ViewModelBindableType {
    var viewModel : MainViewModel!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var Login: UIButton!
    func bindViewModel() {
        signup.rx.action = viewModel.goToSignUp()
        Login.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: {
            let api = LoginApi()
            api.fetch(userInfo: UserInfo(email: self.email.text ?? "", password: self.password.text ?? "")) { result in
                switch result {
                case .success(let data):
                    var dict : [String : Any]?
                    dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                    self.saveLog(dict: dict)
                    self.viewModel.moveToFeed()
                    break
                case .failure(let err):
                    print("FUCK")
                    print(err)
                    break
                }
            }
        }).disposed(by: rx.disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
extension ViewController {
    func saveLog(dict : [String : Any]?) {
        guard let token = dict?["accessToken"] else{return}
        guard let refreshToken = dict?["refreshToken"] else { return}
        guard let accessTokenExpiresIn = dict?["accessTokenExpiresIn"] else { return}
        guard let grantType = dict?["grantType"] else { return }
        var chain: String = self.email.text! + " " + self.password.text! + " "
        
        chain += token as! String
        chain += " "
        chain += String(accessTokenExpiresIn as! Int)
        chain += " "
        chain += grantType as! String
        chain += " "
        chain += refreshToken as! String
        let key = keyChain()
        key.create("codev", account: "loginData", value: chain)
    }
}
/*
extension ViewController {
    // 지금 이전 로그인 정보가 저장이 되어 있는가?
    func keyCheck() {
        let key = keyChain()
        guard let readResult = key.read("codev", account: "loginData") else {
            return
        }
        // Loga Data 정보에 담기는것을 생각해보면
        // ID + 비밀 번호 + Token + expire + grantType + refreshToken!
        // 한번에 넣을꺼임!
        let LogData = readResult.split(separator: " ")
        let expire = Int(LogData[2]) ?? 0
        let now = Int(Date().timeIntervalSince1970 * 1000) ?? 0
        print(LogData
        )
        if now > expire { // expire
            reissue(String(LogData[2]), String(LogData[5]))
        }else {
            self.vc()
            
        }
    }
    func vc () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "tabBarController")
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    
    func reissue(_ token: String, _ refresh: String){
        let URL = "https://codevpros.com/auth/reissue"
        let API = API()
        let data : Refresh = Refresh(token: token, refresh: refresh)
        let header: HTTPHeaders = [ "Content-Type": "application/json" ]
        let parameters = [
            "accessToken" : data.token,
            "refreshToken" : data.refresh
        ]
        print(parameters)
        let request = AF.request("\(URL)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
        request.validate(statusCode: 200..<500)
            .responseDecodable(of: SimpleResponse<String>.self) {response in
                var dict : [String : Any]?
                dict = try! JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : Any]
                
                
                switch response.result {
                case .success:
                    guard let token = dict?["accessToken"] else{return}
                    guard let refreshToken = dict?["refreshToken"] else { return}
                    guard let accessTokenExpiresIn = dict?["accessTokenExpiresIn"] else { return}
                    guard let grantType = dict?["grantType"] else { return }
                    var chain: String = self.email.text! + " " + self.password.text! + " "
                    
                    chain += token as! String
                    chain += " "
                    chain += String(accessTokenExpiresIn as! Int)
                    chain += " "
                    chain += grantType as! String
                    chain += " "
                    chain += refreshToken as! String
                    let key = keyChain()
                    key.create("codev", account: "loginData", value: chain)
                    print(response.response?.statusCode)
                    self.vc()
                case .failure(let err):
                    return
                }
            }
    }
}

 let URL = "https://codevpros.com/auth/signin"
 let data : UserInfo = UserInfo(email: email.text ?? "", password: password.text ?? "")
 let header: HTTPHeaders = [ "Content-Type": "application/json" ]
 let parameters = [
     "email" : self.email.text,
     "password" : self.password.text
 ]
 let request = AF.request("\(URL)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
 request.validate(statusCode: 200..<300)
     .responseDecodable(of: SimpleResponse<String>.self) {response in
         switch response.result {
         case .success:
             var dict : [String : Any]?
             dict = try! JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : Any]
             guard let token = dict?["accessToken"] else{return}
             guard let refreshToken = dict?["refreshToken"] else { return}
             guard let accessTokenExpiresIn = dict?["accessTokenExpiresIn"] else { return}
             guard let grantType = dict?["grantType"] else { return }
             var chain: String = self.email.text! + " " + self.password.text! + " "
             
             chain += token as! String
             chain += " "
             chain += String(accessTokenExpiresIn as! Int)
             chain += " "
             chain += grantType as! String
             chain += " "
             chain += refreshToken as! String
             print(chain)
             let key = keyChain()
             key.create("codev", account: "loginData", value: chain)
             self.vc()
             print(response.response?.statusCode)
         case .failure(let err):
             return
         }
     }
 **/
