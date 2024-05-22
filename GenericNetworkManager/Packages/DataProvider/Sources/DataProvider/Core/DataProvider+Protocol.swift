//
//  DataProvider+Protocol.swift
//  
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public typealias DataProviderResult<T: Decodable> = ((Result<T, NetworkError>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(
        for request: T,
        result: DataProviderResult<T.ResponseType>?
    )
}
