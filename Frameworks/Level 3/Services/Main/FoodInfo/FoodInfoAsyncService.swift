import Entities
import Combine
import API
import Core
import AppLogger

final class FoodInfoAsyncService {

    private let api: FoodInfoAPIInterface
    private let retryDelay: Double

    public init(
        api: FoodInfoAPIInterface,
        retryDelay: Double = 1
    ) {
        self.api = api
        self.retryDelay = retryDelay
    }

}

extension FoodInfoAsyncService {

    func loadFoodInfo(id: Int) async -> Result<FoodInfo, ServiceError> {
        do {
            return try await Task.retrying(retryDelay: retryDelay) { [weak self] in
                guard let self = self else { return .failure(.notFound(.empty)) }

                let response = try await self.api.foodInfo(byId: id)

                if let foodInfoAPIModel = response.response {
                    let model: FoodInfo = .init(from: foodInfoAPIModel, id: id)
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
