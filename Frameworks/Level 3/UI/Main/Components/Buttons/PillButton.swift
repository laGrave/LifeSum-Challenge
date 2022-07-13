import SwiftUI
import Core
import Localization
import Assets

public struct PillButton: View {

    private let title: String
    private let action: () -> Void

    public init(
        title: String,
        onTap action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.avenir(size: 20, style: .light))
            .frame(width: 287, height: 75)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Colors.Buttons.Pill.Gradient.top.color.toSwiftUI(),
                            Colors.Buttons.Pill.Gradient.bottom.color.toSwiftUI()
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(100)
            .shadow(
                color: UIColor(white: 0, alpha: 0.33).toSwiftUI(),
                radius: 27,
                x: 0,
                y: 16
            )
            .onTapGesture {
                action()
            }
    }

}

struct PillButton_Previews: PreviewProvider {

    static var previews: some View {
        PillButton(title: L10n.Info.Buttons.More.title) {  }
    }
}
