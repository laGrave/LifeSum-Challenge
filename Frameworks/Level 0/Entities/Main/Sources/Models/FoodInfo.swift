public struct FoodInfo: Hashable {

    public let id: Int
    public let title: String
    public let calories: Int
    public let carbs: Float
    public let protein: Float
    public let fat: Fat
    public let fiber: Float
    public let cholesterol: Float
    public let sugar: Float
    public let sodium: Float
    public let potassium: Float
    public let gramsPerServing: Float
    public let pcsText: String

    public init(
        id: Int,
        title: String,
        calories: Int,
        carbs: Float,
        protein: Float,
        fat: Fat,
        fiber: Float,
        cholesterol: Float,
        sugar: Float,
        sodium: Float,
        potassium: Float,
        gramsPerServing: Float,
        pcsText: String
    ) {
        self.id = id
        self.title = title
        self.calories = calories
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.fiber = fiber
        self.cholesterol = cholesterol
        self.sugar = sugar
        self.sodium = sodium
        self.potassium = potassium
        self.gramsPerServing = gramsPerServing
        self.pcsText = pcsText
    }
}
