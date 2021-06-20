//
//  CommonViewModel.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/15.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    init(title: String, sceneCoordinator: SceneCoordinatorType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
    }
}
