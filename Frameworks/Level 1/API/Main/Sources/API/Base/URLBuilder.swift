import Core
import AppLogger
import Foundation

public enum NetworkServerType: String {

    case dev
    case prod

    public var baseURL: URL {
        guard let url = URL(string: path) else {
            let error = "base URL is nil"
            logger.error(error)
            fatalError(error)
        }
        return url
    }

    public static func extractTypeFromConfig() -> Self {
        let configKey = "SERVER_TYPE"
        do {
            let rawType: String = try Configuration.value(for: configKey)
            return .init(rawValue: rawType) ?? .prod
        } catch {
            logger.error("cannot fetch server type from configuration file: \(error)")
            return .prod
        }
    }

}

private extension NetworkServerType {

    private var path: String {
        switch self {
        case .dev,
            .prod:
            // currently we have only one type of URL
            return "https://api.lifesum.com"
        }
    }

}
