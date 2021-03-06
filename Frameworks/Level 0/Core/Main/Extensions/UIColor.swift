import UIKit
import SwiftUI

public extension UIColor {

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            alpha: 1
        )
    }

}

public extension UIColor {

    func toSwiftUI() -> Color {
        .init(self)
    }

}
