//
//  DecodableResponseRequest.swift
//  
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
