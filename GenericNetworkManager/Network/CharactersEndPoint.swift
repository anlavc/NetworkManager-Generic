//
//  CharactersEndPoint.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation

enum AllCharacterEndPoint {
    case characters
}

extension AllCharacterEndPoint: APIEndPointType {
    
    var path: String {
        switch self {
        case .characters:
            return "/character"
        }
    }
    
    var baseURL: String {
        switch self {
        case .characters:
            return "https://rickandmortyapi.com/api"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethod {
        switch self {
        case .characters:
            return .GET
        }
    }
    
    var body: Encodable? {
        switch self {
        case .characters:
            return nil
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
