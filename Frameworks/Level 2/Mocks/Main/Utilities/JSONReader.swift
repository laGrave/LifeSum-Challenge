import Foundation
import AppLogger

final class JSONReader {

    public static func entity<T>(from resource: String) -> T? where T: Decodable {
        guard let data = Self.data(from: resource)
        else { return nil }

        do {
            let entity = try Decoder().decode(T.self, from: data)
            return entity
        } catch {
            logger.error(error.localizedDescription)
        }

        return nil
    }

    private static func data(from resource: String) -> Data? {
        let path = Bundle(for: Self.self).url(
            forResource: resource,
            withExtension: "json"
        )
        guard let path = path,
              let data = try? Data(contentsOf: path)
        else { return nil }

        return data
    }

}
