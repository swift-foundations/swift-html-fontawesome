import HTML

public struct FontAwesomeSelfHosted: FontAwesomeLoader {
    public let cssPath: Href
    public let jsPath: Src?
    public let `defer`: Defer
    public let async: Async

    public init(
        cssPath: Href,
        jsPath: Src? = nil,
        defer: Defer = true,
        async: Async = false
    ) {
        self.cssPath = cssPath
        self.jsPath = jsPath
        self.defer = `defer`
        self.async = async
    }
}

extension FontAwesomeSelfHosted {
    public var loadingStrategy: LoadingStrategy {
        .selfHosted(path: cssPath)
    }

    public var body: some HTML.View {
        HTML.Group {
            link(
                href: cssPath,
                rel: "stylesheet"
            )

            if let jsPath {
                script(
                    src: jsPath,
                    async: async,
                    defer: `defer`
                )
            }
        }
    }
}
