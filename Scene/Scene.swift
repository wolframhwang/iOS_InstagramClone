//
//  Scene.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import UIKit

enum Scene {
    case main(MainViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .main(let viewModel):
            guard var vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? ViewController else {
                fatalError()
            }
            DispatchQueue.main.async {
                vc.bind(viewModel: viewModel)
            }
            
            return vc
        }
    }
}
