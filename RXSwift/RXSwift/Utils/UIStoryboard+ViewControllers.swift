//
//  UIStoryboard+ViewControllers.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: .main)
    }
}

extension UIStoryboard {
    var loginVC: LoginViewController {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("LoginViewController couldn't be found in Storyboard file")
        }
        return vc
    }

    var homeVC: HomeViewController {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError("HomeViewController couldn't be found in Storyboard file")
        }
        return vc
    }
}
