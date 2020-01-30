//
//  ViewModelType.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
