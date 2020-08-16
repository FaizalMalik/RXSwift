//
//  App.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

final class App {
    static let shared = App()

    func startInterface(in window: UIWindow) {

        let loginNavigationController = UINavigationController()
        let loginNavigator = LoginNavigator(navigationController: loginNavigationController)

        let loginViewModel = LoginViewModel(dependencies: LoginViewModel.Dependencies(api: LoginApi(), navigator: loginNavigator))
        let loginViewController = UIStoryboard.main.loginViewController
        loginViewController.viewModel = loginViewModel
        loginNavigationController.viewControllers = [loginViewController]

        window.rootViewController = loginNavigationController
        window.makeKeyAndVisible()

    }
}
