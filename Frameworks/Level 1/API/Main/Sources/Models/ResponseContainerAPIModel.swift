import Foundation

public struct ResponseContainerAPIModel<Model: Decodable>: Decodable {

    public let meta: ResponseMetaAPIModel
    public let response: Model?

}
