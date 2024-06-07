//
//  LocationViewModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//


import DataProvider
import SwiftUI


final class LocationViewModel: ObservableObject {
    private let dataProvider =  XApiDataProvider.shared.apiDataProvider
    @Binding var navPath: [Routers]
    @Published var locationUrl: String
    @Published var location:LocationModel? = nil
    
    init(navPath: Binding<[Routers]>, locationUrl: String, location: LocationModel? = nil) {
         self._navPath = navPath
         self.locationUrl = locationUrl
         self.location = location
     }
    
    func fetchLocationRequest(url: String) {
        let request = LocationRequest(url: url)
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                location = LocationModel(id: response.id, name: response.name, type: response.type, dimension: response.dimension, residents: response.residents, url: response.url, created: response.created)
                print("------Response-------", response)
            case .failure(let error):
                print("------Error----------", error)
            }
        }
    }
    
    func onTapNavHome() {
        navPath.removeAll()
    }
    
    func onTapNavPathBack() {
        navPath.removeLast()
    }
}
        
struct LocationRequest: XCharacters {
    typealias ResponseType = LocationModel
    var path: String = ""
    var url: String
    var method: DataProvider.RequestMethod = .get
}
