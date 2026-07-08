import HTML

public struct FontAwesomeList<Content: HTML.View>: HTML.View {
    let icon: FontAwesomeIcon?
    let content: Content

    public init(
        icon: FontAwesomeIcon? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.icon = icon
        self.content = content()
    }

    public var body: some HTML.View {
        ul {
            content
        }
        .attribute("class", icon != nil ? "fa-ul" : nil)
    }
}

public struct FontAwesomeListItem<Content: HTML.View>: HTML.View {
    let icon: FontAwesomeIcon
    let content: Content

    public init(
        icon: FontAwesomeIcon,
        @HTML.Builder content: () -> Content
    ) {
        self.icon = icon
        self.content = content()
    }

    public init(
        icon: FontAwesomeIcon,
        _ text: String
    ) where Content == HTML.Text {
        self.icon = icon
        self.content = HTML.Text(text)
    }

    public var body: some HTML.View {
        li {
            span {
                icon
            }
            .attribute("class", "fa-li")

            content
        }
    }
}
