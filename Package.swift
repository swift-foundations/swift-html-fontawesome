// swift-tools-version: 6.4

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
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .macCatalyst(.v27),
        .visionOS(.v27),
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
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
