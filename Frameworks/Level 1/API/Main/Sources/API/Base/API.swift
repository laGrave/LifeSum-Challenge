import Foundation

public class API: APIInterface {

    private let session: URLSession
    private let host: String
    private lazy var decoder = JSONDecoder()

    public init(networkServerType: NetworkServerType) {
        session = .shared
        host = networkServerType.host
    }

    func sendRequest<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response {
        guard let request = makeRequest(from: endpoint) else {
            throw APIError.missingRequest
        }
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(Response.self, from: data)
    }

    private func makeRequest(from endpoint: Endpoint) -> URLRequest? {
        var urlComponents = endpoint.urlComponents
        urlComponents.host = host
        return urlComponents.url.map { .init(url: $0) }
    }

}
