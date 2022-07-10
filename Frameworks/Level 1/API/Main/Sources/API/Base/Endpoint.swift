enum Endpoint {

    case foodInfo(Int)

}

extension Endpoint {

    var path: String {
        endpointBasePath + {
            switch self {
            case let .foodInfo(id):
                return "codetest?foodid=\(id)"
            }
        }()
    }

}

private extension Endpoint {

    var endpointBasePath: String {
        "v2/foodipedia/"
    }

}
