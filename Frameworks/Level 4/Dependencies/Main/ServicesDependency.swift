import Services

// for testing
import Mocks

public class ServicesDependency {

    public let foodInfo: FoodInfoServiceInterface

    init(tools: ToolsDependency) {
        foodInfo = FoodInfoService(
            api: tools.api,
            storage: tools.storage
        )
    }

}
