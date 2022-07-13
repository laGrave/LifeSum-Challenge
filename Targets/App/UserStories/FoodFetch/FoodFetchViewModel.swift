import Services
import Entities
import Combine
import Foundation

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

    @Published
    var isDownloadActive = false

    var bag = Set<AnyCancellable>()

    private let foodInfoService: FoodInfoServiceInterface

    // MARK: - Lifecycle
    init(foodInfoService: FoodInfoServiceInterface) {
        self.foodInfoService = foodInfoService

        output.foodInfoLoaded
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] _ in
                    guard let self = self else { return }
                    self.isDownloadActive = false
                }
            )
            .store(in: &bag)
    }

}

// MARK: - Private
private extension FoodFetchViewModel {

    func foodInfoWithRandomId() -> AnyPublisher<FoodInfo, Never> {
        func getByRandom() -> AnyPublisher<FoodInfo, ServiceError> {
            let random = Int.random(in: 195...220)
            return foodInfoService.loadFoodInfo(id: random)
        }

        return getByRandom()
            .catch { _ in self.foodInfoWithRandomId() }
            .eraseToAnyPublisher()
    }

    func randomFoodPublisher() -> AnyPublisher<FoodInfo, Never> {
        input
            .randomId
            .flatMap { _ -> AnyPublisher<FoodInfo, Never> in
                self.isDownloadActive = true
                return self.foodInfoWithRandomId()
            }
            .eraseToAnyPublisher()
    }

}
