# Generic Network Manager
 
With Network Manager, you can now easily manage your internet requests, send and receive data.
How to manage page navigation with SwfitUI via a rooter. One of the best examples.


## Installation
After downloading to install the project, you can use it by importing it

## Functionality
```swift
public enum RequestMethod {
    case connect
    case delete
    case get
    case head
    case options
    case patch
    case post
    case put
    case trace
}
```
## RequestProtocol
```swift
public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
```

To use the network manager you must `import DataProvider` at the top of the relevant class.


```swift
  private let dataProvider =  XApiDataProvider.shared.apiDataProvider
```


The network manager can then be called with something like the following

```swift
    func fetchTestRequest() {
        let request = TestRequests()
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                print("--Response--", response)
            case .failure(let error):
                print("--Error--", error)
            }
        }
    }
}
```
## Getting Started

To run the iOSNetworkExample project, follow these steps:

```swift
public struct TestRequests: XApiClient {
    public typealias ResponseType = TodoResponse
    public var path: String = "todos/1"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]

    public init() {
    }
}
```

```swift
public struct TodoResponse: Decodable {
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let completed: Bool?
}
```

```swift
public protocol XApiClient: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension XApiClient {
    var encoding: RequestEncoding {
        switch method {
        case .get, .put:
            return .url
        case .post:
            return .json
        default:
            return .json
        }
    }
}

// MARK: - URL
public extension XApiClient {
    var url: String {
        return "https://jsonplaceholder.typicode.com/" + path
    }
}

// MARK: - RequestParameters
public extension XApiClient {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension XApiClient {
    var headers: RequestHeaders {
        return [:]
    }
}
```
![Simulator Screen Recording - 14pro - 2024-06-01 at 20 40 20](https://github.com/anlavc/NetworkManager-Generic/assets/50744756/e1ace0af-f985-499e-b68b-349ca550c766)
