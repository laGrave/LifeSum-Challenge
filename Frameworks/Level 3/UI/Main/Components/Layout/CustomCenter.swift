import SwiftUI

extension HorizontalAlignment {

    enum Custom: AlignmentID {
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            dimension[HorizontalAlignment.center]
        }
    }

    static let custom = HorizontalAlignment(Custom.self)

}

extension VerticalAlignment {

    enum Custom: AlignmentID {
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            dimension[VerticalAlignment.center]
        }
    }

    static let custom = VerticalAlignment(Custom.self)

}

extension Alignment {

    static let custom = Alignment(
        horizontal: .custom,
        vertical: .custom
    )

}
