//
//  NavigationStackManager.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 30.05.2024.
//

import SwiftUI


enum Routers: Hashable {
    case list
    case character(id: Int)
    case location(locationUrl: String)
}

struct NavigationStackManager: View {
    @State private var navPaths = [Routers]()
    
    var body: some View {
        NavigationStack(path: $navPaths) {
            ListHomeView(model: ListViewModel(navPath: $navPaths))
                .navigationDestination(for: Routers.self) { router in
                    switch router {
                    case .list:
                        ListHomeView(model: ListViewModel(navPath: $navPaths))
                    case .character(let id):
                        CharactersView(model: CharacterViewModel(navPaths: $navPaths, characterID: id)).navigationBarBackButtonHidden(true)
                    case .location(locationUrl: let locationUrl):
                        LocationView(model: LocationViewModel(navPath: $navPaths, locationUrl: locationUrl)).navigationBarBackButtonHidden(true)
                    }
                }
        }
    }
}


#Preview {
    NavigationStackManager()
}
