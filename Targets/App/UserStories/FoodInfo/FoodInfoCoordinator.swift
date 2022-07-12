import Entities
import UI
import Combine

final class FoodInfoCoordinator: ObservableObject {

    // MARK: - Stored properties

    let viewModel: FoodInfoViewModel

    // MARK: - Lifecycle

    init(info: FoodInfo) {
        viewModel = .init(info: info)
    }

}
