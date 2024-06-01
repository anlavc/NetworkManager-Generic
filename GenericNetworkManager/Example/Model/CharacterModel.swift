//
//  CharacterModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//

import Foundation

struct CharactersModel:Codable {
    let id: Int
    let title:String
    let imageURL: String
    let status: String
    let gender: String
    let origin: Location
}
