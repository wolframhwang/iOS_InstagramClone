//
//  Scene.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import UIKit

enum Scene {
    case main(MainViewModel)
    case singup(SignUpViewModel)
    case feed(FeedViewModel)
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
        case .singup(let viewModel):
            guard var vc = storyboard.instantiateViewController(withIdentifier: "SingUpVC") as? UINavigationController else {
                fatalError()
            }
            guard var realVC = vc.viewControllers.first as? SignUpViewController else {
                fatalError()
            }
            
            realVC.bind(viewModel: viewModel)
            
            return vc
        case .feed(let viewModel):
            guard var vc = storyboard.instantiateViewController(withIdentifier: "FeedVC") as? UITabBarController else{
                fatalError()
            }
            guard var realVC = vc.viewControllers?.first as? FeedViewController else{
                fatalError()
            }
            realVC.bind(viewModel: viewModel as! FeedViewController.ViewModelType)
            return vc
        }
        
    }
}
