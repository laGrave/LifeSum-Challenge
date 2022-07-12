import SwiftUI
import UI

struct FoodInfoCoordinatorView: View {

    @ObservedObject
    var coordinator: FoodInfoCoordinator

    // MARK: - Views

    var body: some View {
        FoodInfoView(viewModel: coordinator.viewModel)
    }

}
