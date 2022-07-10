import Foundation

public class API: APIInterface {

    private let session: URLSession
    private let baseURL: URL
    private lazy var decoder = JSONDecoder()

    public init(networkServerType: NetworkServerType) {
        session = .shared
        baseURL = networkServerType.baseURL
    }

    func sendRequest<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response {
        let url = baseURL.appendingPathComponent(endpoint.path)
        let (data, _) = try await session.data(from: url)
        return try decoder.decode(Response.self, from: data)
    }

}
