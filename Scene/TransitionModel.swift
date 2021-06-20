//
//  TransitionModel.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation

enum TransitionStyle {
   case root
   case push
   case modal
}


enum TransitionError: Error {
   case navigationControllerMissing
   case cannotPop
   case unknown
}
