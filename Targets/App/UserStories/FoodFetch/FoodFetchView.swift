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
        VStack {
            ZStack {
                EmptyView()

                if viewModel.isDownloadActive {
                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(
                                tint: Color.red
                            )
                        )
                }
            }
                .frame(height: 50)
            PillButton(title: L10n.FetchInfo.Buttons.Random.title) {
                if !viewModel.isDownloadActive {
                    viewModel.input.randomId.send()
                }

            }
        }
    }

}
