//
//  FoodMenuNavigator.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

protocol FoodMenuNavigatable {
 
    func navigateToItemDetailsScreen(item:MenuItem)
}

final class FoodMenuNavigator: FoodMenuNavigatable {
    
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigateToItemDetailsScreen(item:MenuItem) {
        
        let vc = UIStoryboard.main.itemDetail
        vc.item = item
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc, animated: true)
    }
   
}
