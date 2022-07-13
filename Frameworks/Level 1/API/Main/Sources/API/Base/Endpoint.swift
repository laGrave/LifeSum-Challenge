import Foundation

enum Endpoint {

    case foodInfo(Int)

}

extension Endpoint {

    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.path = endpointBasePath
        components.queryItems = {
            switch self {
            case let .foodInfo(id):
                return [.init(name: "foodid", value: String(id))]
            }
        }()
        return components
    }

}

private extension Endpoint {

    var endpointBasePath: String {
        "/v2/foodipedia/codetest"
    }

}
