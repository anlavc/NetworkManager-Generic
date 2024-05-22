//
//  AllCharactersModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation

struct Rick: Codable {
    let info: Info
    let results: [AllResult]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct AllResult: Codable {
    let id: Int
    let status: Status
    let name, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
}

struct Location: Codable {
    let name: String
    let url: String
}
