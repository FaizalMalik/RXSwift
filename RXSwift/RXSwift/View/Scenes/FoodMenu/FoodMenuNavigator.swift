//
//  FoodMenuNavigator.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

protocol FoodMenuNavigatable {
    func navigateToMovieDetailScreen(withMovieId id: Int, api: FoodieApiProvider)
    func navigateToPersonDetailScreen()
    func navigateToShowDetailScreen()
}

final class FoodMenuNavigator: FoodMenuNavigatable {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToMovieDetailScreen(withMovieId id: Int, api: FoodieApiProvider) {
 
        
    }

    func navigateToPersonDetailScreen() {

    }

    func navigateToShowDetailScreen() {

    }
}
