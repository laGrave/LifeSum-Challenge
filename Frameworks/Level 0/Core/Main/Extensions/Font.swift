import SwiftUI
import UIKit

public extension Font {

    init(uiFont: UIFont) {
        self = .init(uiFont as CTFont)
    }

}

public extension Font {

    enum Style {
        case medium
        case light
        case oblique
        case roman

        var name: String {
            switch self {
            case .medium:
                return "Avenir-Medium"
            case .light:
                return "Avenir-Light"
            case .oblique:
                return "Avenir-Oblique"
            case .roman:
                return "Avenir-Roman"
            }
        }
    }

    static func avenir(size: CGFloat, style: Style) -> Self {
        .init(
            uiFont: .init(name: style.name, size: size) ?? .systemFont(ofSize: size)
        )
    }

}
