import Entities
import Combine

public protocol FoodInfoServiceInterface {

    func loadFoodInfo(id: Int) -> Combine.AnyPublisher<Entities.FoodInfo, ServiceError>

}
