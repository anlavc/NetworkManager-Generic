//
//  LocationEndPoint.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//

import Foundation
import DataProvider

protocol XLocation: DecodableResponseRequest {
    var url: String { get }
}

extension XLocation {
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

// MARK: - RequestParameters
extension XLocation {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
extension XLocation {
    var headers: RequestHeaders {
        return [:]
    }
}
