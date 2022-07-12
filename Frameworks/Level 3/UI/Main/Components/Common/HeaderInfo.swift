import SwiftUI
import Assets
import Core

public struct HeaderInfo: View {

    private let title: String
    private let value: String
    private let description: String

    public init(
        title: String,
        value: String,
        description: String
    ) {
        self.title = title
        self.value = value
        self.description = description
    }

    public var body: some View {
        ZStack(alignment: .custom) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Colors.HeaderInfo.Gradient.top.color.toSwiftUI(),
                            Colors.HeaderInfo.Gradient.bottom.color.toSwiftUI()
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .alignmentGuide(VerticalAlignment.custom) { dimension in
                    dimension[VerticalAlignment.center]
                }
                .frame(width: 272, height: 272)
                .shadow(
                    color: Colors.HeaderInfo.shadow.color.toSwiftUI(),
                    radius: 24,
                    x: 0,
                    y: 8
                )

            VStack {
                VStack(spacing: 5) {
                    Text(title)
                        .font(.avenir(size: 14, style: .light))
                        .foregroundColor(.white)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white)
                }
                    .fixedSize(
                        horizontal: true,
                        vertical: false
                    )

                Text(value)
                    .font(.avenir(size: 50, style: .roman))
                    .foregroundColor(.white)
                    .alignmentGuide(VerticalAlignment.custom) { dimension in
                        dimension[VerticalAlignment.center]
                    }

                Text(description)
                    .font(.avenir(size: 14, style: .oblique))
                    .foregroundColor(.white)
            }
            .frame(height: 100)
        }
    }

}

struct HeaderInfo_Previews: PreviewProvider {

    static var previews: some View {
        HeaderInfo(
            title: "CASHEWS",
            value: "400",
            description: "Calories per serving"
        )
    }

}
