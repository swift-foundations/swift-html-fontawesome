import HTML

public struct FontAwesomeDuotone: HTML.View {
    let icon: String
    let primaryColor: String?
    let primaryOpacity: Double?
    let secondaryColor: String?
    let secondaryOpacity: Double?
    let size: FontAwesomeSize?

    public init(
        _ icon: String,
        primaryColor: String? = nil,
        primaryOpacity: Double? = nil,
        secondaryColor: String? = nil,
        secondaryOpacity: Double? = 0.4,
        size: FontAwesomeSize? = nil
    ) {
        self.icon = icon
        self.primaryColor = primaryColor
        self.primaryOpacity = primaryOpacity
        self.secondaryColor = secondaryColor
        self.secondaryOpacity = secondaryOpacity
        self.size = size
    }

    public var body: some HTML.View {
        i {
            HTML.Empty()
        }
        .attribute("class", classString)
        .style(styleString)
    }

    private var classString: String {
        var classes = ["fad", "fa-\(icon)"]
        if let sizeClass = size?.className {
            classes.append(sizeClass)
        }
        return classes.joined(separator: " ")
    }

    private var styleString: String {
        var styles: [String] = []

        if let primaryColor {
            styles.append("--fa-primary-color: \(primaryColor)")
        }

        if let primaryOpacity {
            styles.append("--fa-primary-opacity: \(primaryOpacity)")
        }

        if let secondaryColor {
            styles.append("--fa-secondary-color: \(secondaryColor)")
        }

        if let secondaryOpacity {
            styles.append("--fa-secondary-opacity: \(secondaryOpacity)")
        }

        return styles.joined(separator: "; ")
    }
}
