

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
