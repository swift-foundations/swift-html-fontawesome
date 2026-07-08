public enum FontAwesomeStyle: String, Sendable, CaseIterable {
    case solid = "fas"
    case regular = "far"
    case light = "fal"
    case thin = "fat"
    case duotone = "fad"
    case brands = "fab"
}

extension FontAwesomeStyle {
    public var className: String {
        self.rawValue
    }

    public var isPro: Bool {
        switch self {
        case .solid, .regular, .brands:
            return false

        case .light, .thin, .duotone:
            return true
        }
    }
}

public enum FontAwesomeSharpStyle: String, Sendable, CaseIterable {
    case solid = "fass"
    case regular = "fasr"
    case light = "fasl"
    case thin = "fast"
    case duotone = "fasd"
}

extension FontAwesomeSharpStyle {
    public var className: String {
        self.rawValue
    }

    public var isPro: Bool {
        true
    }
}
