////
////  CharactersEndPoint.swift
////  GenericNetworkManager
////
////  Created by Anıl AVCI on 22.05.2024.
////
//
import Foundation
import DataProvider

protocol XCharacters: DecodableResponseRequest {}

// MARK: - RequestEncoding
extension XCharacters {
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
extension XCharacters {
    var url: String {
        return "https://rickandmortyapi.com/api" + path
    }
}

// MARK: - RequestParameters
extension XCharacters {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
extension XCharacters {
    var headers: RequestHeaders {
        return [:]
    }
}
