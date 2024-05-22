//
//  CharactersViewModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation


@Observable
final class CharactersViewModel {
    
    private let characterNetworkServices: CharacterNetworkServicesProtocol
    
    init(characterNetworkServices: CharactersNetworkServices = CharactersNetworkServices(networkService: APIManager())) {
        self.characterNetworkServices = characterNetworkServices
    }
    
    var allCharacters: [AllCharactersCellModel] = []
    
    func fetchCharacters() async {
        do {
            
            let characters = try await characterNetworkServices.fetchCharacters()
            self.allCharacters = characters.results.compactMap({
                return .init(title: $0.name, imageURL: $0.image)
            })
        } catch {
            if let networkError = error as? NetworkError {
                print(networkError.localizedDescription)
            } else {
                print("Unknown Error: \(error)")
            }
        }
    }
}

struct AllCharactersCellModel: Hashable {
    let title: String
    let imageURL: String
}
