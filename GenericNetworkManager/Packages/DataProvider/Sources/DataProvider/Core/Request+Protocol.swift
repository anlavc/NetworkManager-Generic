//
//  RequestProtocol.swift
//  
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
