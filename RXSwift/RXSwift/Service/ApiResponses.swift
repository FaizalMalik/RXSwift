//
//  TMDBApiResponses.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    let success: Bool
}

struct AuthTokenResponse: Decodable {
    let requestToken: String

    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
