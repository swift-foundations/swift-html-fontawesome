import HTML

public protocol FontAwesomeLoader: HTML.View {
    var loadingStrategy: LoadingStrategy { get }
}

public enum LoadingStrategy: Sendable {
    case cdn(version: String)
    case kit(id: String)
    case selfHosted(path: Href)
}
