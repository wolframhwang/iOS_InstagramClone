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
    private let email : String?
    private let password: String?
    
    var initialEmail: Driver<String?> {
        return Observable.just(email)
            .asDriver(onErrorJustReturn: nil)
    }
    var initialPassword: Driver<String?> {
        return Observable.just(password)
            .asDriver(onErrorJustReturn: nil)
    }
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, email: String?, password: String?) {
        
        self.email = email
        self.password = password
        super.init(title: title, sceneCoordinator: sceneCoordinator)
    }
    func goToSignUp() -> CocoaAction {
        return CocoaAction { _ in
            let signUpViewModel = SignUpViewModel(title: "SignUp", sceneCoordinator: self.sceneCoordinator)
            let signUpScene = Scene.singup(signUpViewModel)
            return self.sceneCoordinator.transition(to: signUpScene, using: .modal, animated: false
            ).asObservable().map{ _ in}
            
        }
    }
        
    
    func fetchToken() -> Observable<Bool> {
        return Observable.create { emitter in//데이터!
            let api = LoginApi()
            api.fetch(userInfo: UserInfo(email: self.email ?? "", password: self.password ?? "")) { result in
                switch result {
                case .success(let data):
                    emitter.onNext(true)
                    emitter.onCompleted()
                    break
                case .failure(let err):
                    emitter.onError(err)
                    break
                }
            }
            return Disposables.create()
        }
    }
}
