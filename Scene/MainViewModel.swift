//
//  MainViewModel.swift
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

class MainViewModel: CommonViewModel, HasDisposeBag {
    
    func goToSignUp() -> CocoaAction {
        return CocoaAction { _ in
            let signUpViewModel = SignUpViewModel(title: "SignUp", sceneCoordinator: self.sceneCoordinator, displayId: nil, email: nil, nickname: nil, password: nil)
            let signUpScene = Scene.singup(signUpViewModel)            
            return self.sceneCoordinator.transition(to: signUpScene, using: .modal, animated: true).asObservable().map{ _ in}
        }
    }    
}
