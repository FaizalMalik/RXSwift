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
         
            let homeTab = self.setupTabbar()
         self.navigationController.present(homeTab, animated: true, completion: nil)

        
        }

    }
    
    func setupTabbar() -> BubbleTabBarController{
        ///Food menu view controller setup
                 let foodMenuNavigationController = UINavigationController()
                        let foodMenuNavigator = FoodMenuNavigator(navigationController: foodMenuNavigationController)
                        let foodMenuViewModel = FoodMenuViewModel(dependencies: FoodMenuViewModel.Dependencies(api: FoodieApi(), navigator: foodMenuNavigator))
                        let foodMenuViewController = UIStoryboard.main.foodMenuVC
                        foodMenuViewController.viewModel = foodMenuViewModel
           
        
                        let tabBarController = BubbleTabBarController()
                        tabBarController.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.3992300928, green: 0.6294427514, blue: 0.3783345222, alpha: 1)
            
        
                        foodMenuNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: nil)
        foodMenuNavigationController.navigationBar.tintColor = #colorLiteral(red: 0.3992300928, green: 0.6294427514, blue: 0.3783345222, alpha: 1)
                        foodMenuNavigationController.viewControllers = [foodMenuViewController]
          //The below two vc are sample, but need to implement features later
               let cartVC = UIViewController()
               cartVC.view.backgroundColor = .white
               cartVC.tabBarItem = UITabBarItem(title: "Cart", image: #imageLiteral(resourceName: "list"), tag: 0)
        
               let orderVc = UIViewController()
                orderVc.view.backgroundColor = .white
                orderVc.tabBarItem = UITabBarItem(title: "Account", image: #imageLiteral(resourceName: "account"), tag: 0)
                tabBarController.viewControllers = [
                            foodMenuNavigationController,cartVC,orderVc]
                tabBarController.modalPresentationStyle = .fullScreen
                      
       return tabBarController
    }
}
