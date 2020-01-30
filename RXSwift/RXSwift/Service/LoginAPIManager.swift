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
    private struct Constants {
        static let apiKey = "3f093e78fd47d26523d784196a33f00a"
    }
    
    private let httpClient: HTTPClientProvider
    
    init(httpClient: HTTPClientProvider = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    
    func login(withUsername username: String, password: String) -> Observable<Bool> {
        return fetchAuthToken()
            .flatMap { [weak self] (token: String?) -> Observable<Data?> in
                guard let strongSelf = self,
                    let token = token else { return Observable.just(nil) }
                return strongSelf.httpClient.post(url: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(Constants.apiKey)",
                    params: ["username": username, "password": password, "request_token": token])
            }
            .map { (data: Data?) -> Bool in
                guard let data = data,
                    let response = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                        return false
                }
                return response.success
            }
    }


    private func fetchAuthToken() -> Observable<String?> {
        return httpClient.get(url: "https://api.themoviedb.org/3/authentication/token/new?api_key=\(Constants.apiKey)")
                .map { data -> String? in
                    guard let data = data,
                        let response = try? JSONDecoder().decode(AuthTokenResponse.self, from: data) else {
                            return nil
                    }
                    return response.requestToken
                }
    }
}
