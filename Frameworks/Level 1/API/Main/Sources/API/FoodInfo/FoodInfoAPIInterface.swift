public protocol FoodInfoAPIInterface: APIInterface {

    func foodInfo(byId id: Int) async throws -> ResponseContainerAPIModel<FoodInfoAPIModel>

}
