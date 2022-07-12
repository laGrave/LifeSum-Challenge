import SwiftUI
import Dependencies

@main
struct LifeSumApp: App {

    var body: some Scene {
        let dependencies = DependenciesContainer()

        let foodFetchCoordinator = FoodFetchCoordinator(services: dependencies.services)

        WindowGroup {
            FoodFetchCoordinatorView(coordinator: foodFetchCoordinator)
        }
    }

}
