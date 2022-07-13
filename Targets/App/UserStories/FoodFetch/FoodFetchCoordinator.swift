import SwiftUI
import Combine
import Entities
import Services
import Dependencies

final class FoodFetchCoordinator: ObservableObject {

    @Published
    var foodInfoCoordinator: FoodInfoCoordinator?

    // MARK: - Stored properties

    let viewModel: FoodFetchViewModel

    // MARK: - Lifecycle

    init(services: ServicesDependency) {
        viewModel = .init(
            foodInfoService: services.foodInfo
        )

        setupNavigation(services: services)
    }

    func setupNavigation(services: ServicesDependency) {
        viewModel.output
            .foodInfoLoaded
            .receive(on: DispatchQueue.main)
            .map { info in
                FoodInfoCoordinator(info: info)
            }
            .assign(to: &$foodInfoCoordinator)
    }

}
