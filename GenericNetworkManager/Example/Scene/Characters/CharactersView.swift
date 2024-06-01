//
//  CharactersView.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 30.05.2024.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var model: CharacterViewModel
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing:5) {
              
              Text(model.singleCharacters?.title ?? "")
                    .font(.title)
                Text("Status: ") + Text(model.singleCharacters?.status ?? "")  .fontWeight(.bold)
                Text("Species: ") +  Text(model.singleCharacters?.gender ?? "")  .fontWeight(.bold)
                
                HStack {
                    Text("Last known location:")
                    Button(action: {
                        model.dataAppend()
                    }, label: {
                        Text(model.singleCharacters?.origin.name ?? "")
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    })
               
                }
                Spacer()
            }
        }
        .navigationBarItems(
            leading:  Image(systemName: "arrow.left.circle.fill").resizable().frame(width: 32, height: 32).onTapGesture {
                model.onTapNavPathBack()
            },
            trailing: Text("Character").font(.title3)
        )
        .onAppear(perform: {
            model.fetchCharactersRequest(id: model.characterID)
        })
    }
}

#Preview {
    CharactersView(model: CharacterViewModel(navPaths: .constant([]), characterID: 1))
}
