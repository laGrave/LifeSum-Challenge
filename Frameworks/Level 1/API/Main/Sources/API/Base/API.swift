import Foundation

public class API: APIInterface {

    var session: URLSession

    public init {
        session = .shared
    }

}