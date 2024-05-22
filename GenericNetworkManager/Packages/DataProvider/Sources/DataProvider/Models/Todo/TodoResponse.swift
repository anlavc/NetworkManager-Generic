//
//  TodoResponse.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public struct TodoResponse: Decodable {
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let completed: Bool?
}
