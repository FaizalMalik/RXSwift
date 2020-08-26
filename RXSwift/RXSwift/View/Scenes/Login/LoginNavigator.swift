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
         
            

                 let foodMenuNavigationController = UINavigationController()
                        let foodMenuNavigator = FoodMenuNavigator(navigationController: foodMenuNavigationController)
                        let foodMenuViewModel = FoodMenuViewModel(dependencies: FoodMenuViewModel.Dependencies(api: FoodieApi(), navigator: foodMenuNavigator))
                        let foodMenuViewController = UIStoryboard.main.foodMenuVC
                        foodMenuViewController.viewModel = foodMenuViewModel
           
        
                        let tabBarController = UITabBarController()
                        tabBarController.tabBar.barTintColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0)
                        tabBarController.tabBar.tintColor = .white
        
                        foodMenuNavigationController.tabBarItem = UITabBarItem(title: "FoodMenu", image: nil, selectedImage: nil)
                        foodMenuNavigationController.viewControllers = [foodMenuViewController]
        
        
        
                        tabBarController.viewControllers = [
                            foodMenuNavigationController
        
                        ]
            tabBarController.modalPresentationStyle = .fullScreen
                      
        self.navigationController.present(tabBarController, animated: true, completion: nil)

        
        
        
        }

    }
}
