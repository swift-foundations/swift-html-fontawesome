import Testing

@testable import HTMLFontAwesome

@Suite("README Verification")
struct ReadmeVerificationTests {

    // MARK: - Loading FontAwesome (lines 54-65)

    @Test
    func `Loading FontAwesome - Kit (line 54-55)`() throws {
        let kit = FontAwesomeKit(kitId: "your-kit-id")
        #expect(kit.kitId == "your-kit-id")
    }

    @Test
    func `Loading FontAwesome - CDN (line 57-58)`() throws {
        let cdn = FontAwesomeCDN(version: "6.5.1")
        #expect(cdn.version == "6.5.1")
    }

    @Test
    func `Loading FontAwesome - Self-hosted (line 60-64)`() throws {
        let selfHosted = FontAwesomeSelfHosted(
            cssPath: "/assets/fontawesome/css/all.min.css",
            jsPath: "/assets/fontawesome/js/all.min.js"
        )
        #expect(selfHosted.cssPath == "/assets/fontawesome/css/all.min.css")
        #expect(selfHosted.jsPath == "/assets/fontawesome/js/all.min.js")
    }

    // MARK: - Basic Icon Usage (lines 70-83)

    @Test
    func `Basic Icon Usage - Simple icon (line 70-71)`() throws {
        let icon = FontAwesomeIcon("check")
        #expect(icon.name == "check")
    }

    @Test
    func `Basic Icon Usage - Fluent API (line 73-77)`() throws {
        let icon = FontAwesomeIcon("spinner")
            .animate(.spin)
            .size(.large)
            .ariaLabel("Loading...")
        #expect(icon.name == "spinner")
        #expect(icon.animation == .spin)
        #expect(icon.size != nil)
        #expect(icon.ariaLabel == "Loading...")
    }

    @Test
    func `Basic Icon Usage - Pre-defined icons (line 79-82)`() throws {
        let check = FontAwesomeIcon.check
        let github = FontAwesomeIcon.github
        let envelope = FontAwesomeIcon.envelope
        #expect(check.name == "check")
        #expect(github.name == "github")
        #expect(envelope.name == "envelope")
    }

    // MARK: - Icon Styles (lines 90-99)

    @Test
    func `Icon Styles - Free styles (line 90-93)`() throws {
        let solid = FontAwesomeIcon("house", style: .solid)
        let regular = FontAwesomeIcon("house", style: .regular)
        let brands = FontAwesomeIcon("github", style: .brands)
        #expect(solid.style == .solid)
        #expect(regular.style == .regular)
        #expect(brands.style == .brands)
    }

    @Test
    func `Icon Styles - Pro styles (line 95-98)`() throws {
        let light = FontAwesomeIcon("house", style: .light)
        let thin = FontAwesomeIcon("house", style: .thin)
        let duotone = FontAwesomeIcon("house", style: .duotone)
        #expect(light.style == .light)
        #expect(thin.style == .thin)
        #expect(duotone.style == .duotone)
    }

    // MARK: - Animations and Transforms (lines 104-114)

    @Test
    func `Animations and Transforms - Animations (line 104-107)`() throws {
        let bell = FontAwesomeIcon.bell.animate(.shake)
        let heart = FontAwesomeIcon.heart.animate(.beat)
        let cog = FontAwesomeIcon.cog.animate(.spin)
        #expect(bell.animation == .shake)
        #expect(heart.animation == .beat)
        #expect(cog.animation == .spin)
    }

    @Test
    func `Animations and Transforms - Rotations (line 109-110)`() throws {
        let icon = FontAwesomeIcon("arrow-right").rotate(.rotate90)
        #expect(icon.rotation == .rotate90)
    }

    @Test
    func `Animations and Transforms - Flips (line 112-113)`() throws {
        let icon = FontAwesomeIcon("shield").flip(.horizontal)
        #expect(icon.flip == .horizontal)
    }

    // MARK: - Size Options (lines 118-125)

    @Test
    func `Size Options (line 118-125)`() throws {
        let xs = FontAwesomeIcon("star", size: .extraSmall)
        let sm = FontAwesomeIcon("star", size: .small)
        let lg = FontAwesomeIcon("star", size: .large)
        let xl = FontAwesomeIcon("star", size: .extraLarge)
        let x2 = FontAwesomeIcon("star", size: .x2)
        let x10 = FontAwesomeIcon("star", size: .x10)
        // Verify icons have sizes set by checking className
        #expect(xs.size?.className == "fa-xs")
        #expect(sm.size?.className == "fa-sm")
        #expect(lg.size?.className == "fa-lg")
        #expect(xl.size?.className == "fa-xl")
        #expect(x2.size?.className == "fa-2x")
        #expect(x10.size?.className == "fa-10x")
    }

    // MARK: - Components (lines 130-154)

    @Test
    func `Components - Button with icon (line 130-131)`() throws {
        let button = FontAwesomeButton(icon: .download, "Download Report")
        #expect(button.icon.name == "download")
    }

    @Test
    func `Components - Button with trailing icon (line 133-138)`() throws {
        let button = FontAwesomeButton(
            icon: .arrowRight,
            "Next",
            iconPosition: .trailing
        )
        #expect(button.icon.name == "arrow-right")
        #expect(button.iconPosition == .trailing)
    }

    @Test
    func `Components - Label with icon (line 140-141)`() throws {
        let label = FontAwesomeLabel(icon: .user, "Profile")
        #expect(label.icon.name == "user")
    }

    @Test
    func `Components - List with icons (line 143-147)`() throws {
        let list = FontAwesomeList(icon: .check) {
            FontAwesomeListItem(icon: .check, "Task complete")
            FontAwesomeListItem(icon: .times, "Task failed")
        }
        #expect(list.icon?.name == "check")
    }

    @Test
    func `Components - Icon stacking (line 149-153)`() throws {
        let stack = FontAwesomeStack {
            FontAwesomeStackItem(icon: .circle, size: .x2)
            FontAwesomeStackItem(icon: .flag, size: .x1, inverse: true)
        }
        #expect(stack.size == nil)
    }

    // MARK: - Accessibility (lines 159-170)

    @Test
    func `Accessibility - ARIA label (line 159-161)`() throws {
        let icon = FontAwesomeIcon.trash
            .ariaLabel("Delete item")
        #expect(icon.ariaLabel == "Delete item")
    }

    @Test
    func `Accessibility - Title attribute (line 163-165)`() throws {
        // Create icon with title through initializer
        let icon = FontAwesomeIcon("circle-info", title: "More information")
        #expect(icon.title == "More information")
    }

    @Test
    func `Accessibility - ARIA hidden (line 167-169)`() throws {
        let icon = FontAwesomeIcon.star
            .ariaHidden()
        #expect(icon.ariaHidden == true)
    }

    // MARK: - Fixed Width Icons (lines 175-179)

    @Test
    func `Fixed Width Icons (line 175-178)`() throws {
        let home = FontAwesomeIcon.home.fixedWidth()
        let search = FontAwesomeIcon.search.fixedWidth()
        let settings = FontAwesomeIcon.settings.fixedWidth()
        #expect(home.fixedWidth == true)
        #expect(search.fixedWidth == true)
        #expect(settings.fixedWidth == true)
    }
}
