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
    
    private let dataProvider =  XApiDataProvider.shared.apiDataProvider
    
    var allCharacters: [AllCharactersCellModel] = []
    
    //Test Request
    func fetchTestRequest() {
        let request = TestRequests()
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                print("--Response--", response)
            case .failure(let error):
                print("--Error--", error)
            }
        }
    }
    
    func fetchCharactersRequest() {
        let request = CharactersRequest()
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                allCharacters = response.results.compactMap({
                    AllCharactersCellModel(title: $0.name, imageURL: $0.image)
                })
                print("------Response-------", response)
            case .failure(let error):
                print("------Error----------", error)
            }
        }
    }
}

struct CharactersRequest:XCharacters {
    typealias ResponseType = Rick
    var path: String = "/character"
    var method: DataProvider.RequestMethod = .get
}


