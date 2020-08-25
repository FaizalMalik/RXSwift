//
//  TMDBApi.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import RxSwift
import RxCocoa

protocol LoginApiServiceProtocol {
    func login(withUsername username: String, password: String) -> Observable<Bool>
}

protocol LoginApiService: LoginApiServiceProtocol { }

final class LoginApi: LoginApiServiceProtocol {
  

    private let httpClient: HTTPClientProvider

    init(httpClient: HTTPClientProvider = HTTPClient()) {
        self.httpClient = httpClient
    }

    func login(withUsername username: String, password: String) -> Observable<Bool> {
      
        //Implement the Api call here
        return Observable.just(true)
        
      
    }

    
}
