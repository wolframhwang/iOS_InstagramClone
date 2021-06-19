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
    var signupAction: CocoaAction
    init(title: String, sceneCoordinator: SceneCoordinatorType, displayId: String?, email: String?, nickname: String?, password: String?, signupAction: CocoaAction? = nil) {
        self.displayId = displayId; self.email = email; self.nickname = nickname; self.password = password
        self.signupAction = CocoaAction {
            if let action = signupAction {
                action.execute(())
            }
            return sceneCoordinator.close(animated: true).asObservable().map {_ in}
        }
        super.init(title: title, sceneCoordinator: sceneCoordinator)
    }    
}
