
import Foundation

public struct TestRequests: XApiClient {
    public typealias ResponseType = TodoResponse

    public var path: String = "todos/1"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]

    public init() {
    }
}
