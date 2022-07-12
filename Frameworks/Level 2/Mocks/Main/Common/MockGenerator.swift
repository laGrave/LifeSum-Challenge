import API
import Entities

public class MockGenerator {

    public init() {}

}

extension MockGenerator: FoodInfoAPIInterface {

    public func foodInfo(byId id: Int) async throws -> ResponseContainerAPIModel<FoodInfoAPIModel> {
        guard let mock = FoodInfoAPIModel.loadMock(correct: true) else {
            throw MockError()
        }
        return mock
    }

}
