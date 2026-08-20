import HTML

public struct FontAwesomeCDN: FontAwesomeLoader {
    public let version: String
    public let integrity: HTML.Integrity.Attribute?
    public let crossorigin: HTML.Crossorigin.Attribute?
    public let `defer`: HTML.Defer.Attribute
    public let async: HTML.Async.Attribute

    public init(
        version: String = "6.5.1",
        integrity: HTML.Integrity.Attribute? = nil,
        crossorigin: HTML.Crossorigin.Attribute? = "anonymous",
        defer: HTML.Defer.Attribute = true,
        async: HTML.Async.Attribute = false
    ) {
        self.version = version
        self.integrity = integrity
        self.crossorigin = crossorigin
        self.defer = `defer`
        self.async = async
    }
}

extension FontAwesomeCDN {
    public var loadingStrategy: LoadingStrategy {
        .cdn(version: version)
    }

    public var body: some HTML.View {
        link(
            crossorigin: crossorigin,
            href: .init(
                "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/css/all.min.css"
            ),
            integrity: integrity,
            referrerpolicy: .noReferrer,
            rel: .stylesheet
        )
        .attribute(HTML.Defer.Attribute.attribute, `defer`.description)
    }
}

public struct FontAwesomeCDNScript: FontAwesomeLoader {
    public let version: String
    public let integrity: HTML.Integrity.Attribute?
    public let crossorigin: HTML.Crossorigin.Attribute?
    public let `defer`: HTML.Defer.Attribute
    public let async: HTML.Async.Attribute

    public init(
        version: String = "6.5.1",
        integrity: HTML.Integrity.Attribute? = nil,
        crossorigin: HTML.Crossorigin.Attribute? = "anonymous",
        defer: HTML.Defer.Attribute = true,
        async: HTML.Async.Attribute = false
    ) {
        self.version = version
        self.integrity = integrity
        self.crossorigin = crossorigin
        self.defer = `defer`
        self.async = async
    }
}

extension FontAwesomeCDNScript {
    public var loadingStrategy: LoadingStrategy {
        .cdn(version: version)
    }

    public var body: some HTML.View {
        HTML.Group {
            script(
                src: .init(
                    "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/js/all.min.js"
                ),
                async: async,
                defer: `defer`,
                integrity: integrity,
                referrerpolicy: .noReferrer,
                crossorigin: crossorigin
            )

            link(
                crossorigin: crossorigin,
                href: .init(
                    "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/\(version)/css/all.min.css"
                ),
                integrity: integrity,
                referrerpolicy: .noReferrer,
                rel: .stylesheet
            )
        }
    }
}
