//
//  Encodable+Extension.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (
            try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            )
        ).flatMap { $0 as? [String: Any] }
    }

    var data: Data? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return data
    }
}
