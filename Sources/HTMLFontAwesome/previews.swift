//
//  File.swift
//  swift-html-fontawesome
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2025.
//

#if canImport(SwiftUI)
    import SwiftUI
    import HTML

    #Preview {
        HTML.Document {
            div {
                FontAwesomeIcon.coffee.size(.x5).style(.solid)
                h4 { "Coffee" }.css.marginTop(.em(0.25))
                p {

                    let link = a(
                        href:
                            "https://www.washingtonpost.com/archive/lifestyle/magazine/1997/11/09/grounds-for-suspicion/075c7cfe-d5cf-4443-ae42-a95e6e46fed7"
                    ) {
                        "my opinion"
                    }

                    // SwiftUI #Preview-only code (design-time tooling, not shipped/executed
                    // in production or tests); `String(link)` on a provably-valid `a(href:)`
                    // element cannot fail here.
                    // swiftlint:disable force_try
                    #"""
                    It is inhumane, in \#(try! String(link)), to force people who have a genuine medical need for coffee to wait in line behind people who apparently view it as some kind of recreational activity.
                    """#
                    // swiftlint:enable force_try
                }
            }
            .css.textAlign(.center)

        } head: {
            FontAwesomeCDN()
            Meta.utf8
        }
    }
#endif
