import SwiftUI
import UI

// For preview
import Dependencies

struct FoodFetchCoordinatorView: View {

    @ObservedObject
    var coordinator: FoodFetchCoordinator

    // MARK: - Views

    var body: some View {
        NavigationView {
            FoodFetchView(viewModel: coordinator.viewModel)
                .navigation(item: $coordinator.foodInfoCoordinator) {
                    FoodInfoCoordinatorView(coordinator: $0)
                }
        }
    }

}
