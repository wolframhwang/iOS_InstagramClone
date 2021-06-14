//
//  ViewController.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/12.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyInput()
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
        
        return true
    }
}

