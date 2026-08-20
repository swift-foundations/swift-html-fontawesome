import HTML

public struct FontAwesomeKit: FontAwesomeLoader {
    public let kitId: String
    public let async: HTML.Async.Attribute
    public let crossorigin: HTML.Crossorigin.Attribute?

    public init(
        kitId: String,
        async: HTML.Async.Attribute = true,
        crossorigin: HTML.Crossorigin.Attribute? = "anonymous"
    ) {
        self.kitId = kitId
        self.async = async
        self.crossorigin = crossorigin
    }
}

extension FontAwesomeKit {
    public var loadingStrategy: LoadingStrategy {
        .kit(id: kitId)
    }

    public var body: some HTML.View {
        script(
            src: "https://kit.fontawesome.com/\(kitId).js",
            async: async,
            crossorigin: crossorigin
        )
    }
}
