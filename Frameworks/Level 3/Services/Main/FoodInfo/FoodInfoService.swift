import Combine
import Foundation
import API
import Entities

public final class FoodInfoService {

    private let asyncService: FoodInfoAsyncService

    public init(api: FoodInfoAPIInterface) {
        asyncService = .init(api: api)
    }

    private func publisher<Output>(
        action: @escaping (FoodInfoAsyncService) async -> Result<Output, ServiceError>
    ) -> AnyPublisher<Output, ServiceError> {
        Future {
            await action(self.asyncService)
        }
            .eraseToAnyPublisher()
    }

}

extension FoodInfoService: FoodInfoServiceInterface {

    public func loadFoodInfo(id: Int) -> Combine.AnyPublisher<FoodInfo, ServiceError> {
        publisher { await $0.loadFoodInfo(id: id) }
    }

}
