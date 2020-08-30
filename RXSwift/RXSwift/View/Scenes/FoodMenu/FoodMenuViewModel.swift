//
//  FoodMenuViewModel.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import RxSwift
import RxCocoa

final class FoodMenuViewModel: ViewModelType {
    struct Input {
        let ready: Driver<Void>
        let selected: Driver<(Int, Int)>
    }

    struct Output {
        let loading: Driver<Bool>
        let results: Driver<[CarouselViewModel]>
        let selected: Driver<Void>
    }

    struct Dependencies {
        let api: FoodieApiProvider
        let navigator: FoodMenuNavigatable
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

        func transform(input: FoodMenuViewModel.Input) -> FoodMenuViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()

        let results = input.ready
            .asObservable()
            .flatMap {
                 Observable.zip(self.dependencies.api.fetchBreakFast(),
                                self.dependencies.api.fetchMainCourse(),
                                self.dependencies.api.fetchDessert(),
                                self.dependencies.api.fetchDrinks())
                    .trackActivity(activityIndicator)
            }
            .share()

        let mappedResults = results
            .map { breakFast, mainCourse, dessert , drinks in
                return [CarouselViewModel(menu: breakFast, title: "Break Fast"),
                        CarouselViewModel(menu: mainCourse, title: "Main Course"),
                        CarouselViewModel(menu: dessert, title: "Desserts"),
                        CarouselViewModel(menu: drinks, title: "Drinks")]
                    .compactMap { $0 } // If one of the network requests fails, CarouselViewModel is nil and compactMap removes nils from array
                                       // so the data is not displayed
            }
            .asDriver(onErrorJustReturn: [])

        let selected = input.selected
            .asObservable()
            .withLatestFrom(results) { ($0, $1 ) }
            .do(onNext: { [weak self] (index: (Int, Int), res: ([MenuItem]?, [MenuItem]?, [MenuItem]?,[MenuItem]?)) in
                guard let strongSelf = self else { return }
                let (carouselIndex, selectedIndex) = index
                let (breakFast, mainCourse, dessert , drinks) = res

                switch carouselIndex {
                
                case 0 :
                    strongSelf.dependencies.navigator.navigateToItemDetailsScreen(item:(breakFast?[selectedIndex])! )
                    case 1 :
                                       strongSelf.dependencies.navigator.navigateToItemDetailsScreen(item:(mainCourse?[selectedIndex])! )
                    case 2 :
                                       strongSelf.dependencies.navigator.navigateToItemDetailsScreen(item:(dessert?[selectedIndex])! )
                    case 3 :
                                       strongSelf.dependencies.navigator.navigateToItemDetailsScreen(item:(drinks?[selectedIndex])! )


                default: return
                }
            })
            .map { _ in () }
            .asDriver(onErrorJustReturn: ())

        return Output(loading: loading,
                      results: mappedResults,
                      selected: selected)
    }
}

extension CarouselViewModel {
    
    init?(menu: [MenuItem]?, title:String) {
        guard let menu = menu else { return nil }
        self.title = title
        self.subtitle = "\(menu.count) items available"
        self.items = menu.map { CarouselItemViewModel(item: $0) }
    }
}

struct CarouselItemViewModel {
    let title: String
    let subtitle: String
    let imageUrl: String?
}

struct CarouselViewModel {
    let title: String
    let subtitle: String
    let items: [CarouselItemViewModel]
}

extension CarouselItemViewModel {
   
    init(item: MenuItem) {
        self.title = item.name
        self.subtitle = "$ " + "\(item.price)"
        self.imageUrl = item.thumbnailImage
    }
    
    
}
