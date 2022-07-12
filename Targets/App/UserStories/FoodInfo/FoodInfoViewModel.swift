import Services
import Entities
import Combine
import Localization
import Core

final class FoodInfoViewModel: FoodInfoViewModelInterface {

    // MARK: - Input

    struct Input: FoodInfoViewModelInput {
        let more = PassthroughSubject<Void, Never>()
    }

    // MARK: - Stored properties

    let input: FoodInfoViewModelInput = Input()
    private let info: FoodInfo

    @Published
    var expanded: Bool = false

    // MARK: - Lifecycle

    init(info: FoodInfo) {
        self.info = info
    }

}

extension FoodInfoViewModel {

    var header: FoodInfoHeader {
        .init(
            title: info.title.uppercased(),
            value: String(info.calories),
            description: info.pcsText
        )
    }

    var stackedItems: [FoodInfoStackedItem] {
        if expanded {
            return [
                .init(
                    title: L10n.Info.carbs.uppercased(),
                    value: info.carbs.toPercents()
                ),
                .init(
                    title: L10n.Info.protein.uppercased(),
                    value: info.protein.toPercents()
                ),
                .init(
                    title: L10n.Info.Fat.common.uppercased(),
                    value: info.fat.common.toPercents()
                ),
                .init(
                    title: L10n.Info.Fat.saturated.uppercased(),
                    value: info.fat.saturated.toPercents()
                ),
                .init(
                    title: L10n.Info.Fat.unsaturated.uppercased(),
                    value: info.fat.unsaturated.toPercents()
                ),
                .init(
                    title: L10n.Info.fiber.uppercased(),
                    value: info.fiber.toPercents()
                ),
                .init(
                    title: L10n.Info.cholesterol.uppercased(),
                    value: info.cholesterol.toPercents()
                ),
                .init(
                    title: L10n.Info.sugar.uppercased(),
                    value: info.sugar.toPercents()
                ),
                .init(
                    title: L10n.Info.cholesterol.uppercased(),
                    value: info.sodium.toPercents()
                ),
                .init(
                    title: L10n.Info.cholesterol.uppercased(),
                    value: info.potassium.toPercents()
                ),
                .init(
                    title: L10n.Info.gramsperserving.uppercased(),
                    value: info.gramsPerServing.toPercents()
                )
            ]
        } else {
            return [
                .init(
                    title: L10n.Info.carbs.uppercased(),
                    value: info.carbs.toPercents()
                ),
                .init(
                    title: L10n.Info.protein.uppercased(),
                    value: info.protein.toPercents()
                ),
                .init(
                    title: L10n.Info.Fat.common.uppercased(),
                    value: info.fat.common.toPercents()
                )
            ]
        }
    }

}
