//
//  CharactersViewModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation
import DataProvider

@Observable
final class CharactersViewModel {
    
    private let characterNetworkServices: CharacterNetworkServicesProtocol
    private let dataProvider =  XApiDataProvider.shared.apiDataProvider
    
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
    
    func fetchTestRequest() {
        let request = TestRequests()
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                print("dsadsa", response)
            case .failure(let error):
                print("dsadsa", error)
            }
        }
    }
}

struct AllCharactersCellModel: Hashable {
    let title: String
    let imageURL: String
}
