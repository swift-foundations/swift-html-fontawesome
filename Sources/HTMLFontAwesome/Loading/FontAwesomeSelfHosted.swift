import HTML

public struct FontAwesomeSelfHosted: FontAwesomeLoader {
    public let cssPath: HTML.Href.Attribute
    public let jsPath: HTML.Src.Attribute?
    public let `defer`: HTML.Defer.Attribute
    public let async: HTML.Async.Attribute

    public init(
        cssPath: HTML.Href.Attribute,
        jsPath: HTML.Src.Attribute? = nil,
        defer: HTML.Defer.Attribute = true,
        async: HTML.Async.Attribute = false
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
