import API
import Storage

final class ToolsDependency {

    let api: API
    let storage: DataStorage

    init() {
        api = .init(networkServerType: .extractTypeFromConfig())
        storage = DataStorage()
    }

}
