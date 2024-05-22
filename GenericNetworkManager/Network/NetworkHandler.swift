//
//  NetworkHandler.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation

    final class NetworkHandler {

        func requestDataAPI(url: URLRequest) async throws -> Data {
            let (data, response) = try await URLSession.shared.data(for: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            switch httpResponse.statusCode {
            case 200...299:
                return data
            case 400..<500:
                throw NetworkError.network("Network Eroor 400..500")
            case 500..<600:
                throw NetworkError.serverError
            default:
                throw NetworkError.invalidResponse
            }
        }
    }

