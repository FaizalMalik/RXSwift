//
//  UIViewController+Rx.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in }
        return ControlEvent(events: source)
    }
}
