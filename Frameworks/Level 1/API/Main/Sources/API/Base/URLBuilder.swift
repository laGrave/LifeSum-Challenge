import Core
import AppLogger
import Foundation

public enum NetworkServerType: String {

    case dev = "DEVELOPMENT"
    case prod = "PRODUCTION"

    public var host: String {
        switch self {
        case .dev,
             .prod:
            // currently we have only one type of URL
            return "api.lifesum.com"
        }
    }

    public static func extractTypeFromConfig() -> Self {
        let configKey = "Server type"
        do {
            let rawType: String = try Configuration.value(for: configKey)
            return .init(rawValue: rawType) ?? .prod
        } catch {
            logger.error("cannot fetch server type from configuration file: \(error)")
            return .prod
        }
    }

}
