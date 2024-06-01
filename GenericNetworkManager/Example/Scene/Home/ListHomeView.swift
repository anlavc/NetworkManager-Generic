//
//  ContentView.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import SwiftUI

struct ListHomeView: View {
    @ObservedObject var model: ListViewModel
  
    var body: some View {
        
            ScrollView(.horizontal) {
                HStack {
                    ForEach(model.allCharacters, id: \.self) { character in
                        VStack(alignment :.leading,spacing: 5) {
                            Button(action: {
                                model.characterAppend(id: character.id)
                            }) {
                                HStack {
                                    Text(character.title)
                                    Image(systemName: "arrow.right.square")
                                }
                                .padding(.trailing)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                            }
                      
                            AsyncImage(url: URL(string: character.imageURL)) { image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .frame(maxWidth: 300)
                        
                    }
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollTargetLayout()
            .contentMargins(20, for: .automatic)
            .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 30)
            .navigationTitle("Rick & Morthy")
        
        .onAppear {
            model.fetchCharactersRequest()
        }
    }
        
}

#Preview {
    ListHomeView(model: ListViewModel(navPath: .constant([])))
}
