//
//  LocationModel.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
