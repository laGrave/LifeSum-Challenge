import SwiftUI
import Core
import Assets

public struct StackedText: View {

    private let text1: String
    private let text2: String

    public init(
        text1: String,
        text2: String
    ) {
        self.text1 = text1
        self.text2 = text2
    }

    public var body: some View {
        VStack(spacing: 10) {
            Text(text1)
                .asStacked()

            Divider()
                .background(Colors.stacked.color.toSwiftUI())

            Text(text2)
                .asStacked()
        }
            .frame(width: 100)
    }

}

fileprivate extension Text {

    private struct StackedText: ViewModifier {

        func body(content: Content) -> some View {
            content
                .font(.avenir(size: 20, style: .light))
                .foregroundColor(
                    Colors.stacked.color.toSwiftUI()
                )
        }
    }

    func asStacked() -> some View {
        modifier(StackedText())
    }

}

struct StackedText_Previews: PreviewProvider {

    static var previews: some View {
        StackedText(text1: "CARBS", text2: "10%")
    }

}
