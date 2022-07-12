import Combine
import SwiftUI
import Entities

protocol FoodInfoViewModelInterface: ObservableObject {

    var input: FoodInfoViewModelInput { get }
    var header: FoodInfoHeader { get }
    var stackedItems: [FoodInfoStackedItem] { get }
    var expanded: Bool { get set }

}

protocol FoodInfoViewModelInput {

    var more: PassthroughSubject<Void, Never> { get }

}
