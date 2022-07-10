public struct FoodInfoAPIModel: Decodable {

    public let id: Int
    public let title: String
    public let calories: Int
    public let carbs: Float
    public let protein: Float
    public let fat: Float
    public let saturatedfat: Float
    public let unsaturatedfat: Float
    public let fiber: Float
    public let cholesterol: Float
    public let sugar: Float
    public let sodium: Float
    public let potassium: Float
    public let gramsperserving: Float
    public let pcstext: String

}
