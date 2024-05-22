//
//  ContentView.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import SwiftUI

struct CharactersView: View {
    @State var model: CharactersViewModel = CharactersViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(model.allCharacters, id: \.self) { character in
                        VStack(alignment :.leading,spacing: 5) {
                            Text(character.title)
                                .font(.title)
                                .fontWeight(.semibold)
                            AsyncImage(url: URL(string: character.imageURL)) { image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollTargetLayout()
            .contentMargins(20, for: .scrollContent)
            .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 10)
            .navigationTitle("Rick & Morthy")
        }
        .onAppear {
            Task {
              await  model.fetchCharacters()
            }
            model.fetchTestRequest()
        }
    }
        
}

#Preview {
    CharactersView()
}
