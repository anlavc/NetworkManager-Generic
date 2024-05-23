//
//  XApiClient.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation
public protocol XApiClient: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension XApiClient {
    var encoding: RequestEncoding {
        switch method {
        case .get, .put:
            return .url
        case .post:
            return .json
        default:
            return .json
        }
    }
}

// MARK: - URL
public extension XApiClient {
    var url: String {
        return "https://jsonplaceholder.typicode.com/" + path
    }
}

// MARK: - RequestParameters
public extension XApiClient {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension XApiClient {
    var headers: RequestHeaders {
        return [:]
    }
}
