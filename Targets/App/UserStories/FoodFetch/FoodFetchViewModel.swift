import Services
import Entities
import Combine

final class FoodFetchViewModel: FoodFetchViewModelInterface {

    struct Output {
        let foodInfoLoaded: AnyPublisher<FoodInfo, Never>
    }

    // MARK: - Input
    struct Input: FoodFetchViewModelInput {
        let randomId = PassthroughSubject<Void, Never>()
    }

    // MARK: - Stored properties

    lazy var output: Output = {
        .init(foodInfoLoaded: randomFoodPublisher())
    }()
    let input: FoodFetchViewModelInput = Input()
    var bag = Set<AnyCancellable>()

    private let foodInfoService: FoodInfoServiceInterface

    // MARK: - Lifecycle
    init(foodInfoService: FoodInfoServiceInterface) {
        self.foodInfoService = foodInfoService
    }

}

// MARK: - Private
private extension FoodFetchViewModel {

    func foodInfoWithRandomId() -> AnyPublisher<FoodInfo, Never> {
        func getByRandom() -> AnyPublisher<FoodInfo, ServiceError> {
//            let random = Int.random(in: 0...250)
            let random = 10
            return foodInfoService.loadFoodInfo(id: random)
        }

        return getByRandom()
            .catch { _ in self.foodInfoWithRandomId() }
            .eraseToAnyPublisher()
    }

    func randomFoodPublisher() -> AnyPublisher<FoodInfo, Never> {
        input
            .randomId
            .flatMap {
                self.foodInfoWithRandomId()
            }
            .eraseToAnyPublisher()
    }

}
