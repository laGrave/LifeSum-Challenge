import Combine
import Foundation
import API
import Entities
import Storage

public final class FoodInfoService {

    private let asyncService: FoodInfoAsyncService

    public init(
        api: FoodInfoAPIInterface,
        storage: FoodInfoStorageInterface
    ) {
        asyncService = .init(
            api: api,
            storage: storage
        )
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

    public func loadFoodInfo(id: Int) -> AnyPublisher<FoodInfo, ServiceError> {
        publisher { await $0.loadFoodInfo(id: id) }
    }

}
