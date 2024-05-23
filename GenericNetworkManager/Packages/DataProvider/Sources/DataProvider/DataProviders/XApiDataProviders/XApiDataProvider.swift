
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
