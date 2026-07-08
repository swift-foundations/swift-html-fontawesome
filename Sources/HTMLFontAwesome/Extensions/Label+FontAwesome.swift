import HTML

public struct FontAwesomeLabel<Title: HTML.View>: HTML.View {
    let icon: FontAwesomeIcon
    let title: Title
    let spacing: LengthPercentage
    let alignment: AlignItems

    public enum IconPosition {
        case leading
        case trailing
    }

    let iconPosition: IconPosition

    public init(
        icon: FontAwesomeIcon,
        spacing: LengthPercentage = .rem(0.25),
        alignment: AlignItems = .center,
        iconPosition: IconPosition = .leading,
        @HTML.Builder title: () -> Title
    ) {
        self.icon = icon
        self.spacing = spacing
        self.alignment = alignment
        self.iconPosition = iconPosition
        self.title = title()
    }

    public init(
        icon: FontAwesomeIcon,
        _ text: String,
        spacing: LengthPercentage = .rem(0.25),
        alignment: AlignItems = .center,
        iconPosition: IconPosition = .leading
    ) where Title == HTML.Text {
        self.icon = icon
        self.spacing = spacing
        self.alignment = alignment
        self.iconPosition = iconPosition
        self.title = HTML.Text(text)
    }

    public var body: some HTML.View {
        span {
            switch iconPosition {
            case .leading:
                icon
                span {
                    title
                }
                .css.marginLeft(.lengthPercentage(spacing))

            case .trailing:
                span {
                    title
                }
                .css.marginRight(.lengthPercentage(spacing))
                icon
            }
        }
        .css.display(.inlineFlex)
        .alignItems(alignment)
    }
}
