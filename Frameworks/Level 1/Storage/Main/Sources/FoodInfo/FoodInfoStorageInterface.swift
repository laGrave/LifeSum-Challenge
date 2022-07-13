import Entities

public protocol FoodInfoStorageInterface: DataStorageInterface {

    func fetchFoodInfo(withId: Int) -> FoodInfo?
    func saveFoodInfo(_: FoodInfo)

}
