//
//  Decodable+Extension.swift
//  
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public extension Decodable {
    init?(from data: Data, using decoder: JSONDecoder = .init()) {
        guard let parsed = try? decoder.decode(Self.self, from: data) else { return nil }
        self = parsed
    }
}
