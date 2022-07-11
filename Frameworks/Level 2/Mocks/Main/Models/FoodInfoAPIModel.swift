import API

public extension FoodInfoAPIModel {

    static func loadMock(correct: Bool) -> ResponseContainerAPIModel<Self>? {
        let resourceName: String = correct ? "FoodInfo" : "FoodInfoWithError"
        return JSONReader.entity(from: resourceName)
    }

}
