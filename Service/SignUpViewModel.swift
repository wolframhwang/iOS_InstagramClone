//
//  SignUpViewModel.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources
import NSObject_Rx

class SignUpViewModel: CommonViewModel, HasDisposeBag {
    private let displayId : String?
    private let email : String?
    private let nickname: String?
    private let password: String?
    
    var log : Bool? = nil
    func signup()->CocoaAction {
        return CocoaAction { _ in
            return self.sceneCoordinator.close(animated: true).asObservable().map {_ in}
        }
    }
    func go(){
        self.sceneCoordinator.forceClose(animated: true)
    }
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, displayId: String?, email: String?, nickname: String?, password: String?){//, signupAction: CocoaAction? = nil) {
        self.displayId = displayId; self.email = email; self.nickname = nickname; self.password = password
        super.init(title: title, sceneCoordinator: sceneCoordinator)
    }
    
    //    func signup()->CocoaAction {
    //        return CocoaAction { _ in
    //            let v = SignUpApi()
    //            v.fetch(signup: SignUp(displayId: self.displayId!, email: self.email!, nickname: self.nickname!, password: self.password!) ) { result in
    //                switch result {
    //                case .success(let data):
    //                    var dict : [String : Any]?
    //                    dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
    //                    return
    //                case .failure(let err):
    //                    print("FUCK")
    //                    print(err)
    //                    break
    //                }
    //            }
    //
    //        }
    //    }
}
