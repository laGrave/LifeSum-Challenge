import Entities
import API

public extension FoodInfo {

    init(from apiModel: FoodInfoAPIModel, id: Int) {
        self.init(
            id: id,
            title: apiModel.title,
            calories: apiModel.calories,
            carbs: apiModel.carbs,
            protein: apiModel.protein,
            fat: .init(
                apiModel.fat,
                saturated: apiModel.saturatedfat,
                unsaturated: apiModel.unsaturatedfat
            ),
            fiber: apiModel.fiber,
            cholesterol: apiModel.cholesterol,
            sugar: apiModel.sugar,
            sodium: apiModel.sodium,
            potassium: apiModel.potassium,
            gramsPerServing: apiModel.gramsperserving,
            pcsText: apiModel.pcstext
        )
    }

}
