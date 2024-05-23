
import Foundation
import Alamofire

public enum NetworkError: Error, LocalizedError {
    case decoding(error: AFError)
    case encoding
    case missingURL
    case badRequest(_ data: Data?)
    case auth(_ data: Data?)
    case forbidden(_ data: Data?)
    case notFound(url: URL?)
    case invalidMethod(_ data: Data?)
    case timeOut(_ data: Data?)
    case requestCancelled(_ data: Data?)
    case noInternetConnection
    case internalServerError(_ data: Data?)
    case unknown
    case baseError(AFError)
}
