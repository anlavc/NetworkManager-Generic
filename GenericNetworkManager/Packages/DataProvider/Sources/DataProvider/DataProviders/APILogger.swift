//
//  APILogger.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import UIKit
import Alamofire

public final class APILogger: EventMonitor {
    static let shared = APILogger()

    public let queue = DispatchQueue(label: "com.genericnetworkmanager.networklogger")

    public func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        print("---> Request Created <---")
        print(request.description)
    }

    public func requestDidFinish(_ request: Request) {
        print("---> Request Finished <---")
        print(request.description)
    }

    public func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("---> Request JSONResponse <---")
        if let data = response.data, let json = String(data: data, encoding: .utf8) {
            print(json)
        }
    }
}
