extension API: FoodInfoAPIInterface {

    public func foodInfo(byId id: Int) async throws -> ResponseContainerAPIModel<FoodInfoAPIModel> {
        try await sendRequest(.foodInfo(id))
    }

}
