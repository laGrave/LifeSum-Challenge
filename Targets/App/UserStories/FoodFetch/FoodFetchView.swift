import SwiftUI
import UI
import Localization

struct FoodFetchView<ViewModel>: View where ViewModel: FoodFetchViewModelInterface {

    @ObservedObject
    private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        PillButton(title: L10n.FetchInfo.Buttons.Random.title) {
            viewModel.input.randomId.send()
        }
    }

}
