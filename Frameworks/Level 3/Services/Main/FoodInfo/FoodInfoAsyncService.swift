import Entities
import API
import Core
import AppLogger
import Storage

final class FoodInfoAsyncService {

    private let api: FoodInfoAPIInterface
    private let storage: FoodInfoStorageInterface
    private let retryDelay: Double

    public init(
        api: FoodInfoAPIInterface,
        storage: FoodInfoStorageInterface,
        retryDelay: Double = 1
    ) {
        self.api = api
        self.storage = storage
        self.retryDelay = retryDelay
    }

}

extension FoodInfoAsyncService {

    func loadFoodInfo(id: Int) async -> Result<FoodInfo, ServiceError> {
        guard let cached = storage.fetchFoodInfo(withId: id) else {
            return await fetchFoodInfoFromServer(id: id)
        }
        return .success(cached)
    }

    private func fetchFoodInfoFromServer(id: Int) async -> Result<FoodInfo, ServiceError> {
        do {
            return try await Task.retrying(retryDelay: retryDelay) { [weak self] in
                guard let self = self else {
                    return .failure(.notFound(.empty))
                }

                let response = try await self.api.foodInfo(byId: id)

                if let foodInfoAPIModel = response.response {
                    let model: FoodInfo = .init(from: foodInfoAPIModel, id: id)
                    self.storage.saveFoodInfo(model)
                    return .success(model)
                } else {
                    let error: NotFoundError = .init(from: response.meta)
                    return .failure(.notFound(error))
                }
            }
            .value
        } catch {
            logger.error(error.localizedDescription)
            return .failure(.underlying(error))
        }
    }

}
