//
//  XApiDataProvider.swift
//
//
//  Created by sercan kaya on 23.05.2024.
//

import Foundation

public final class XApiDataProvider {
    public static let shared = XApiDataProvider()
#if DEBUG
    public let apiDataProvider = APIDataProvider(
    interceptor: XApInterCeptor.shared,
    eventMonitors: [APILogger.shared]
)
#else
    public let apiDataProvider = APIDataProvider(
    interceptor: XApInterCeptor.shared,
    eventMonitors: [APILogger.shared]
)
#endif
}
