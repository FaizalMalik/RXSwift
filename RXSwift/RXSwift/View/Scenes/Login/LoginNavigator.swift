//
//  LoginNavigator.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

protocol LoginNavigatable {
    func toMain()
}

final class LoginNavigator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func toMain() {
        DispatchQueue.main.async {
            let homeVc = UIStoryboard.main.homeVC
                homeVc.modalPresentationStyle = .fullScreen

                self.navigationController.present(homeVc, animated: true, completion: nil)
        }

    }
}
