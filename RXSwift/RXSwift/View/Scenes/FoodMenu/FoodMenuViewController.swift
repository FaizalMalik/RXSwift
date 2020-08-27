//
//  FoodMenuViewController.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class FoodMenuViewController: UIViewController {
    var viewModel: FoodMenuViewModel!

    @IBOutlet weak var carouselsView: FoodMenuMainView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        
  
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func bindViewModel() {
        let input = FoodMenuViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                            selected: carouselsView.selectedIndex.asDriver(onErrorJustReturn: (0, 0)))

        let output = viewModel.transform(input: input)

        output.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)

        output.results
            .drive(onNext: { [weak self] caroselViewModel in
                guard let strongSelf = self else { return }
                strongSelf.carouselsView.setDataSource(caroselViewModel)
                strongSelf.carouselsView.reloadData()
            })
            .disposed(by: disposeBag)

        output.selected
            .drive()
            .disposed(by: disposeBag)
    }
}
