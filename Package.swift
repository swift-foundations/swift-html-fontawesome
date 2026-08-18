// swift-tools-version: 6.3.3

import PackageDescription

extension String {
    static let htmlFontAwesome: Self = "HTMLFontAwesome"
}

extension Target.Dependency {
    static var htmlFontAwesome: Self { .target(name: .htmlFontAwesome) }
}

extension Target.Dependency {
    static var html: Self { .product(name: "HTML", package: "swift-html") }
}

let package = Package(
    name: "swift-html-fontawesome",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .macCatalyst("26.0"),
        .visionOS("27")
    ],
    products: [
        .library(
            name: .htmlFontAwesome,
            targets: [.htmlFontAwesome]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-html.git", branch: "main")
    ],
    targets: [
        .target(
            name: .htmlFontAwesome,
            dependencies: [
                .html
            ]
        ),
        .testTarget(
            name: .htmlFontAwesome.tests,
            dependencies: [
                .htmlFontAwesome
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
