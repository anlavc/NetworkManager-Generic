//
//  CharactersNetworkServices.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation


protocol CharacterNetworkServicesProtocol {
    
    func fetchCharacters() async throws -> Rick
}

final class CharactersNetworkServices: CharacterNetworkServicesProtocol {
    
    private let networkService: APIManagerProtocol
    
    init(networkService: APIManagerProtocol) {
        self.networkService = networkService
    }
    
    func fetchCharacters() async throws -> Rick {
        return try await networkService.request(modelType: Rick.self, type: AllCharacterEndPoint.characters)
        }
    
    }
