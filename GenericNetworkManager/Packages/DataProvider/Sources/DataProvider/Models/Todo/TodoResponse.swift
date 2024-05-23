
import Foundation

public struct TodoResponse: Decodable {
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let completed: Bool?
}
