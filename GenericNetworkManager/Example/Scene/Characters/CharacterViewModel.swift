//
//  CharacterViewModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 30.05.2024.
//

import SwiftUI
import DataProvider


final class CharacterViewModel: ObservableObject {
    
    private let dataProvider =  XApiDataProvider.shared.apiDataProvider
    @Published var singleCharacters: CharactersModel?
    @Binding var navPaths: [Routers]
    @Published var characterID: Int
    
    init(singleCharacters: CharactersModel? = nil, navPaths: Binding<[Routers]>, characterID: Int) {
        self.singleCharacters = singleCharacters
        self._navPaths = navPaths
        self.characterID = characterID
    }
    
    func fetchCharactersRequest(id: Int) {
        let request = CharactersRequest(path: "\(id)")
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                singleCharacters = CharactersModel(id: response.id,title: response.name, imageURL: response.image, status: response.status.rawValue, gender: response.gender, origin: response.origin)
                print("------Response-------", response)
            case .failure(let error):
                print("------Error----------", error)
            }
        }
    }
    func dataAppend() {
        guard let singleCharacters = singleCharacters else {return}
        navPaths.append(.location(locationUrl: singleCharacters.origin.url))
    }
    func onTapNavPathBack() {
        navPaths.removeLast()
    }
}

struct CharactersRequest:XCharacterSingle {
    typealias ResponseType = AllResult
    var path: String
    var method: DataProvider.RequestMethod = .get
}
