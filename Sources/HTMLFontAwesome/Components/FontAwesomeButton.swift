import HTML

public struct FontAwesomeButton<Content: HTML.View>: HTML.View {
    public enum IconPosition {
        case leading
        case trailing
    }

    let icon: FontAwesomeIcon
    let content: Content
    let iconPosition: IconPosition
    let spacing: LengthPercentage

    public init(
        icon: FontAwesomeIcon,
        iconPosition: IconPosition = .leading,
        spacing: LengthPercentage = .rem(0.5),
        @HTML.Builder content: () -> Content
    ) {
        self.icon = icon
        self.iconPosition = iconPosition
        self.spacing = spacing
        self.content = content()
    }

    public init(
        icon: FontAwesomeIcon,
        _ text: String,
        iconPosition: IconPosition = .leading,
        spacing: LengthPercentage = .rem(0.5)
    ) where Content == HTML.Text {
        self.icon = icon
        self.iconPosition = iconPosition
        self.spacing = spacing
        self.content = HTML.Text(text)
    }

    public var body: some HTML.View {
        button {
            switch iconPosition {
            case .leading:
                icon
                    .css.marginRight(.lengthPercentage(spacing))
                content

            case .trailing:
                content
                icon
                    .css.marginLeft(.lengthPercentage(spacing))
            }
        }
    }
}
