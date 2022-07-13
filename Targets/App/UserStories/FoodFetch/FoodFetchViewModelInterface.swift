import Combine
import SwiftUI

protocol FoodFetchViewModelInterface: ObservableObject {

    var input: FoodFetchViewModelInput { get }
    var isDownloadActive: Bool { get }
}

protocol FoodFetchViewModelInput {

    var randomId: PassthroughSubject<Void, Never> { get }

}
