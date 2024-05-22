//
//  APIManager.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 22.05.2024.
//

import Foundation


enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
}

protocol APIEndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
enum NetworkError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(String?)
    case decoding(Error?)
    case serverError
}

protocol APIManagerProtocol {
    func request<T: Codable>(modelType: T.Type,type: APIEndPointType) async throws -> T
}

typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void

final class APIManager: APIManagerProtocol {
    
    static let shared = APIManager()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler
    
    
    init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }
    
    func request<T: Codable>(
        modelType: T.Type,
        type: APIEndPointType
    ) async throws -> T {
        guard let url = type.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        
        if let parameters = type.body {
            request.httpBody = try JSONEncoder().encode(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
        
        do {
            let data = try await networkHandler.requestDataAPI(url: request)
            let response = try await responseHandler.parseResponseDecode(data: data, modelType: modelType)
            return response
        } catch {
            throw error
        }
    }
}

