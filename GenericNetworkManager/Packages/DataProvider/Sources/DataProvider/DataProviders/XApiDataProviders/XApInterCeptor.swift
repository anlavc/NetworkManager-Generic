//
//  XApInterCeptor.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation
import Alamofire

public class XApInterCeptor: RequestInterceptor {
    public static let shared = XApInterCeptor()
    let retryLimit = 1

    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let adaptedRequest = urlRequest
        completion(.success(adaptedRequest))
    }
}
