import Foundation
import HTML
import Testing

@testable import HTMLFontAwesome

extension HTML.View {
    func renderString() -> String {
        String(decoding: [UInt8](self), as: UTF8.self)
    }
}

extension FontAwesomeIcon {
    @Suite("FontAwesome Icon Tests")
    struct Test {

    @Test
    func `Basic icon creation`() {
        let icon = FontAwesomeIcon("check")
        let html = icon.renderString()
        #expect(html.contains("fas"))
        #expect(html.contains("fa-check"))
    }

    @Test
    func `Icon with custom style`() {
        let icon = FontAwesomeIcon("heart", style: .regular)
        let html = icon.renderString()
        #expect(html.contains("far"))
        #expect(html.contains("fa-heart"))
    }

    @Test
    func `Icon with size`() {
        let icon = FontAwesomeIcon("star", size: .x2)
        let html = icon.renderString()
        #expect(html.contains("fa-2x"))
    }

    @Test
    func `Icon with animation`() {
        let icon = FontAwesomeIcon("spinner").animate(.spin)
        let html = icon.renderString()
        #expect(html.contains("fa-spin"))
    }

    @Test
    func `Icon with rotation`() {
        let icon = FontAwesomeIcon("shield").rotate(.rotate90)
        let html = icon.renderString()
        #expect(html.contains("fa-rotate-90"))
    }

    @Test
    func `Icon with flip`() {
        let icon = FontAwesomeIcon("shield").flip(.horizontal)
        let html = icon.renderString()
        #expect(html.contains("fa-flip-horizontal"))
    }

    @Test
    func `Fixed width icon`() {
        let icon = FontAwesomeIcon("home").fixedWidth()
        let html = icon.renderString()
        #expect(html.contains("fa-fw"))
    }

    @Test
    func `Icon with border`() {
        let icon = FontAwesomeIcon("quote").border()
        let html = icon.renderString()
        #expect(html.contains("fa-border"))
    }

    @Test
    func `Icon with ARIA label`() {
        let icon = FontAwesomeIcon("trash").ariaLabel("Delete item")
        let html = icon.renderString()
        #expect(html.contains("aria-label=\"Delete item\""))
    }

    @Test
    func `Icon with ARIA hidden`() {
        let icon = FontAwesomeIcon("star").ariaHidden()
        let html = icon.renderString()
        #expect(html.contains("aria-hidden=\"true\""))
    }

    @Test
    func `Icon with title`() {
        let icon = FontAwesomeIcon("info").title("More information")
        let html = icon.renderString()
        #expect(html.contains("title=\"More information\""))
    }

    @Test
    func `Icon from string literal`() {
        let icon: FontAwesomeIcon = "check"
        let html = icon.renderString()
        #expect(html.contains("fa-check"))
    }

    @Test
    func `Common icon static properties`() {
        let checkIcon = FontAwesomeIcon.check
        let html = checkIcon.renderString()
        #expect(html.contains("fa-check"))

        let githubIcon = FontAwesomeIcon.github
        let githubHtml = githubIcon.renderString()
        #expect(githubHtml.contains("fab"))
        #expect(githubHtml.contains("fa-github"))
    }

    @Test
    func `Fluent API chaining`() {
        let icon = FontAwesomeIcon("user")
            .size(.large)
            .style(.regular)
            .animate(.pulse)
            .fixedWidth()
            .border()
            .ariaLabel("User profile")
            .addClass("custom-class")

        let html = icon.renderString()
        #expect(html.contains("fa-lg"))
        #expect(html.contains("far"))
        #expect(html.contains("fa-pulse"))
        #expect(html.contains("fa-fw"))
        #expect(html.contains("fa-border"))
        #expect(html.contains("custom-class"))
    }
    }
}

@Suite("FontAwesome Loading Tests")
struct FontAwesomeLoadingTests {

    @Test
    func `CDN loader`() {
        let cdn = FontAwesomeCDN(version: "6.5.1")
        let html = cdn.renderString()
        #expect(html.contains("cdnjs.cloudflare.com"))
        #expect(html.contains("6.5.1"))
        #expect(html.contains("all.min.css"))
    }

    @Test
    func `CDN script loader`() {
        let cdn = FontAwesomeCDNScript(version: "6.5.1", defer: true)
        let html = cdn.renderString()
        #expect(html.contains("all.min.js"))
        #expect(html.contains("defer"))
    }

    @Test
    func `Kit loader`() {
        let kit = FontAwesomeKit(kitId: "abc123")
        let html = kit.renderString()
        #expect(html.contains("kit.fontawesome.com"))
        #expect(html.contains("abc123.js"))
    }

    @Test
    func `Self-hosted loader`() {
        let selfHosted = FontAwesomeSelfHosted(
            cssPath: "/assets/fa.css",
            jsPath: "/assets/fa.js"
        )
        let html = selfHosted.renderString()
        #expect(html.contains("/assets/fa.css"))
        #expect(html.contains("/assets/fa.js"))
    }
}

@Suite("FontAwesome Component Tests")
struct FontAwesomeComponentTests {

    @Test
    func `Button with icon`() {
        let button = FontAwesomeButton(icon: .download, "Download")
        let html = button.renderString()
        #expect(html.contains("fa-download"))
        #expect(html.contains("Download"))
        #expect(html.contains("<button"))
    }

    @Test
    func `Button with trailing icon`() {
        let button = FontAwesomeButton(
            icon: .arrowRight,
            "Next",
            iconPosition: .trailing
        )
        let html = button.renderString()
        #expect(html.contains("fa-arrow-right"))
        #expect(html.contains("Next"))
    }

    @Test
    func `List with icons`() {
        let list = FontAwesomeList(icon: .check) {
            FontAwesomeListItem(icon: .check, "Item 1")
            FontAwesomeListItem(icon: .times, "Item 2")
        }
        let html = list.renderString()
        #expect(html.contains("fa-ul"))
        #expect(html.contains("fa-check"))
        #expect(html.contains("fa-times"))
        #expect(html.contains("Item 1"))
        #expect(html.contains("Item 2"))
    }

    @Test
    func `Label with icon`() {
        let label = FontAwesomeLabel(icon: .user, "Profile")
        let html = label.renderString()
        #expect(html.contains("fa-user"))
        #expect(html.contains("Profile"))
    }

    @Test
    func `Icon stack`() {
        let stack = FontAwesomeStack {
            FontAwesomeStackItem(icon: .circle, size: .x2)
            FontAwesomeStackItem(icon: .flag, size: .x1, inverse: true)
        }
        let html = stack.renderString()
        #expect(html.contains("fa-stack"))
        #expect(html.contains("fa-stack-2x"))
        #expect(html.contains("fa-stack-1x"))
        #expect(html.contains("fa-inverse"))
    }
}

extension FontAwesomeStyle {
    @Suite("FontAwesome Style Tests")
    struct Test {

    @Test
    func `Style class names`() {
        #expect(FontAwesomeStyle.solid.className == "fas")
        #expect(FontAwesomeStyle.regular.className == "far")
        #expect(FontAwesomeStyle.light.className == "fal")
        #expect(FontAwesomeStyle.thin.className == "fat")
        #expect(FontAwesomeStyle.duotone.className == "fad")
        #expect(FontAwesomeStyle.brands.className == "fab")
    }

    @Test
    func `Sharp style class names`() {
        #expect(FontAwesomeSharpStyle.solid.className == "fass")
        #expect(FontAwesomeSharpStyle.regular.className == "fasr")
        #expect(FontAwesomeSharpStyle.light.className == "fasl")
        #expect(FontAwesomeSharpStyle.thin.className == "fast")
        #expect(FontAwesomeSharpStyle.duotone.className == "fasd")
    }

    @Test
    func `Pro style detection`() {
        #expect(FontAwesomeStyle.solid.isPro == false)
        #expect(FontAwesomeStyle.regular.isPro == false)
        #expect(FontAwesomeStyle.brands.isPro == false)
        #expect(FontAwesomeStyle.light.isPro == true)
        #expect(FontAwesomeStyle.thin.isPro == true)
        #expect(FontAwesomeStyle.duotone.isPro == true)
    }
    }
}

extension FontAwesomeSize {
    @Suite("FontAwesome Size Tests")
    struct Test {

    @Test
    func `Size class names`() {
        #expect(FontAwesomeSize.normal.className == nil)
        #expect(FontAwesomeSize.extraSmall.className == "fa-xs")
        #expect(FontAwesomeSize.small.className == "fa-sm")
        #expect(FontAwesomeSize.large.className == "fa-lg")
        #expect(FontAwesomeSize.extraLarge.className == "fa-xl")
        #expect(FontAwesomeSize.x2.className == "fa-2x")
        #expect(FontAwesomeSize.x10.className == "fa-10x")
        #expect(FontAwesomeSize.custom("my-size").className == "my-size")
    }
    }
}

extension FontAwesomeAnimation {
    @Suite("FontAwesome Animation Tests")
    struct Test {

    @Test
    func `Animation class names`() {
        #expect(FontAwesomeAnimation.beat.className == "fa-beat")
        #expect(FontAwesomeAnimation.bounce.className == "fa-bounce")
        #expect(FontAwesomeAnimation.fade.className == "fa-fade")
        #expect(FontAwesomeAnimation.flip.className == "fa-flip")
        #expect(FontAwesomeAnimation.pulse.className == "fa-pulse")
        #expect(FontAwesomeAnimation.shake.className == "fa-shake")
        #expect(FontAwesomeAnimation.spin.className == "fa-spin")
        #expect(FontAwesomeAnimation.spinReverse.className == "fa-spin-reverse")
    }

    @Test
    func `Rotation class names`() {
        #expect(FontAwesomeRotation.rotate90.className == "fa-rotate-90")
        #expect(FontAwesomeRotation.rotate180.className == "fa-rotate-180")
        #expect(FontAwesomeRotation.rotate270.className == "fa-rotate-270")
    }

    @Test
    func `Flip class names`() {
        #expect(FontAwesomeFlip.horizontal.className == "fa-flip-horizontal")
        #expect(FontAwesomeFlip.vertical.className == "fa-flip-vertical")
        #expect(FontAwesomeFlip.both.className == "fa-flip-both")
    }
    }
}
