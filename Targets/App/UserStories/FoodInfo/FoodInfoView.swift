import SwiftUI
import UI
import Localization

struct FoodInfoView<ViewModel>: View where ViewModel: FoodInfoViewModelInterface {

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        let header = viewModel.header
                        HeaderInfo(
                            title: header.title,
                            value: header.value,
                            description: header.description
                        )
                            .padding(.bottom, 40)

                        let columns: [GridItem] = Array(
                            repeating: .init(.flexible()),
                            count: viewModel.expanded ? 2 : 3
                        )
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.stackedItems, id: \.self) { item in
                                StackedText(
                                    text1: item.title,
                                    text2: item.value
                                )
                            }
                        }
                            .padding(.horizontal, 20)

                        if !viewModel.expanded {
                            Spacer()
                            PillButton(title: L10n.Info.Buttons.More.title.uppercased()) {
                                withAnimation {
                                    viewModel.expanded.toggle()
                                }
                            }
                        }
                    }
                        .frame(minHeight: geometry.size.height)
                }
            }
        }
    }

}
