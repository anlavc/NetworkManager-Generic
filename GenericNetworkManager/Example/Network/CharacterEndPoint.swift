//
//  CharacterEndPoint.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//

import Foundation
import DataProvider

protocol XCharacterSingle: DecodableResponseRequest {}

extension XCharacterSingle {
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
extension XCharacterSingle {
    var url: String {
        return "https://rickandmortyapi.com/api/character/" + path
    }
}

// MARK: - RequestParameters
extension XCharacterSingle {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
extension XCharacterSingle {
    var headers: RequestHeaders {
        return [:]
    }
}
