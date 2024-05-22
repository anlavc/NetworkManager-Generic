//
//  ResponseHandler.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation

final class ResponseHandler {

    func parseResponseDecode<T: Decodable>(data: Data, modelType: T.Type) async throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(modelType, from: data)
            return decodedData
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
