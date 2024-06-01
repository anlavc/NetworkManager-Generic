//
//  CharactersViewModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import SwiftUI
import DataProvider

final class ListViewModel: ObservableObject {
    private let dataProvider =  XApiDataProvider.shared.apiDataProvider
    
    
    @Binding var navPath: [Routers]
    @Published var allCharacters: [AllCharactersCellModel] = []
    
    init(navPath: Binding<[Routers]>) {
        self._navPath = navPath
    }
    
    func fetchCharactersRequest() {
        let request = CharactersListRequest()
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                allCharacters = response.results.compactMap({
                    AllCharactersCellModel(id: $0.id, title: $0.name, imageURL: $0.image)
                })
                print("------Response-------", response)
            case .failure(let error):
                print("------Error----------", error)
            }
        }
    }
    
    func characterAppend(id: Int) {
        navPath.append(.character(id: id))
    }
}

struct CharactersListRequest:XCharacters {
    typealias ResponseType = Rick
    var path: String = "/character"
    var method: DataProvider.RequestMethod = .get
}


