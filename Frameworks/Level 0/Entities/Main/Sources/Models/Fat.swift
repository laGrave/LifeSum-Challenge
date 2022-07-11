public struct Fat: Hashable {

    public let common: Float
    public let saturated: Float
    public let unsaturated: Float

    public init(
        _ common: Float,
        saturated: Float,
        unsaturated: Float
    ) {
        self.common = common
        self.saturated = saturated
        self.unsaturated = unsaturated
    }

}
