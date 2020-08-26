//
//  FoodieApi.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import RxSwift
import RxCocoa

protocol FoodieApiMenuListProvider {
  
    func fetchBreakFast() -> Observable<[MenuItem]?>
    func fetchMainCourse() -> Observable<[MenuItem]?>
    func fetchDessert() -> Observable<[MenuItem]?>
    func fetchDrinks() -> Observable<[MenuItem]?>

}


protocol FoodieApiAuthProvider {
    func login(withUsername username: String, password: String) -> Observable<Bool>
}

protocol FoodieApiProvider:  FoodieApiAuthProvider,FoodieApiMenuListProvider { }

final class FoodieApi: FoodieApiProvider {
    
    private let httpClient: HTTPClientProvider

    init(httpClient: HTTPClientProvider = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchMainCourse() -> Observable<[MenuItem]?> {
         let menuList  = Bundle.main.decode([MenuSection].self, from: "menu.json")
               let mains =  menuList.filter {$0.name == "Mains" }.first
               
               return Observable.just(mains?.items)
    }
    
    func fetchDessert() -> Observable<[MenuItem]?> {
         let menuList  = Bundle.main.decode([MenuSection].self, from: "menu.json")
               let dessert =  menuList.filter {$0.name == "Dessert" }.first
               
               return Observable.just(dessert?.items)
    }
    
    func fetchDrinks() -> Observable<[MenuItem]?> {
         let menuList  = Bundle.main.decode([MenuSection].self, from: "menu.json")
               let drinks =  menuList.filter {$0.name == "Drinks" }.first
               
               return Observable.just(drinks?.items)
    }
    
    func fetchBreakFast() -> Observable<[MenuItem]?> {
         let menuList  = Bundle.main.decode([MenuSection].self, from: "menu.json")
        let breakFast =  menuList.filter {$0.name == "Breakfast" }.first
        
        return Observable.just(breakFast?.items)
    }
    
   

    func login(withUsername username: String, password: String) -> Observable<Bool> {
     
        return Observable.just(true)
    }


}
