extension API: FoodInfoAPIInterface {

    public func foodInfo(byId id: Int) async throws -> FoodInfoAPIModel {
        try await sendRequest(.foodInfo(id))
    }

}
