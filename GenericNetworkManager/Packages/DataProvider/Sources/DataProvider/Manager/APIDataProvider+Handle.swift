
import Alamofire

public extension APIDataProvider {
    func handle<T: Decodable>(
        error: AFError,
        responseData: AFDataResponse<T>,
        completion: DataProviderResult<T>? = nil
    ) {
        let customError = processStatusCode(responseData: responseData, error: error)
        completion?(.failure(customError))
    }
}
