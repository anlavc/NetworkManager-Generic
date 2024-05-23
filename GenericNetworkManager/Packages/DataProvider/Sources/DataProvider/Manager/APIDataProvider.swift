
import Foundation
import Alamofire
import UIKit

public struct APIDataProvider: DataProviderProtocol {
    private let interceptor: RequestInterceptor?
    private let session: Session

    public init(
        interceptor: RequestInterceptor? = nil,
        eventMonitors: [EventMonitor] = []
    ) {
        self.interceptor = interceptor
        self.session = Session(interceptor: interceptor, eventMonitors: eventMonitors)
        self.session.sessionConfiguration.timeoutIntervalForRequest = 10
        self.session.sessionConfiguration.timeoutIntervalForResource = 10
        self.session.sessionConfiguration.requestCachePolicy = .reloadRevalidatingCacheData
    }

    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = APIRequestAdapter(request: request)
        let request = session.request(
            adapter.url,
            method: adapter.method,
            parameters: adapter.parameters,
            encoding: adapter.encoding,
            headers: adapter.headers
        )
        return request
    }

    // swiftlint:enable multiline_function_chains
    public func request<T: DecodableResponseRequest>(
        for request: T,
        result: DataProviderResult<T.ResponseType>? = nil
    ) {
        let status = NetworkReachabilityManager()?.isReachable ?? false
        guard status else {
            result?(.failure(.noInternetConnection))
            return
        }
        let request = createRequest(request)
        request.validate()
        request.responseDecodable(of: T.ResponseType.self) { response in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                self.handle(error: error, responseData: response, completion: result)
            }
        }
    }
}

// MARK: - Privates
extension APIDataProvider {
    public func processStatusCode<T: Decodable>(
        responseData: AFDataResponse<T>,
        error: AFError
    ) -> NetworkError {
        let statusCode = responseData.response?.statusCode
        switch statusCode {
            /// Bad Request
        case 400: return .badRequest(responseData.data)
            /// Authorization
        case 401: return .auth(responseData.data)
            /// Forbidden
        case 403: return .forbidden(responseData.data)
            /// Not Found
        case 404: return .notFound(url: responseData.response?.url)
            /// Invalid Method
        case 405: return .invalidMethod(responseData.data)
            /// Timeout
        case 408: return .timeOut(responseData.data)
            /// Request Cancelled
        case 499: return .requestCancelled(responseData.data)
            /// Internal Server Error
        case 500: return .internalServerError(responseData.data)
            /// Default
        default: return handleDefaultCase(responseData: responseData, error: error)
        }
    }

    func handleDefaultCase<T: Decodable>(responseData: AFDataResponse<T>, error: AFError) -> NetworkError {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return .noInternetConnection
        }

        /// Response Serialization
        if error.isResponseSerializationError {
            return .decoding(error: error)
        } else {
            /// Default
            return .baseError(error)
        }
    }
}
