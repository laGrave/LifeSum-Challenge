import Entities
import Foundation
import AppLogger

extension DataStorage: FoodInfoStorageInterface {

    public func fetchFoodInfo(withId id: Int) -> FoodInfo? {
        guard let data = defaults.value(forKey: foodInfoKey(forId: id)) as? Data else {
            return nil
        }

        let decoder = JSONDecoder()
        do {
            return try decoder.decode(FoodInfo.self, from: data)
        } catch {
            logger.error("DataStorage \(#function) \(error)")
            return nil
        }
    }

    public func saveFoodInfo(_ info: FoodInfo) {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(info)
            defaults.set(encoded, forKey: foodInfoKey(forId: info.id))
        } catch {
            logger.error("DataStorage \(#function) \(error)")
        }
    }

    private func foodInfoKey(forId id: Int) -> String {
        foodInfoKeyPrefix + String(id)
    }

    private var foodInfoKeyPrefix: String { "defaultsFoodInfo_" }

}
