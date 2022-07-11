import Core
import API

public struct NotFoundError: Error {

    public let details: String
    public let type: String

}

public extension NotFoundError {

    init(from metaModel: ResponseMetaAPIModel) {
        type = metaModel.errorType ?? .empty
        details = metaModel.errorDetail ?? .empty
    }

}

public extension NotFoundError {

    static var empty: Self {
        .init(details: .empty, type: .empty)
    }

}
