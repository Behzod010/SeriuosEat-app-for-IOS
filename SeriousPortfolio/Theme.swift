import SwiftUI

/// The central theme mirroring the editorial, elegant vibe of Serious Eats.
public struct Theme {
    // MARK: - Colors
    
    /// A vibrant, deep burnt orange signature color for accents and highlights.
    public static let brandPrimary = Color(hex: "E35624")
    
    /// Deep charcoal for primary text, softer than pure black.
    public static let textPrimary = Color(hex: "1A1A1A")
    public static let textSecondary = Color(hex: "666666")
    
    /// Off-white for light background
    public static let backgroundLight = Color(hex: "FAFAFA")
    /// Deep rich black for dark background
    public static let backgroundDark = Color.black
    
    /// Background that responds to the color scheme natively.
    public static let background = Color(UIColor.systemBackground)
    public static let surface = Color(UIColor.secondarySystemBackground)
    
    // MARK: - Typography
    
    /// For grand presentation titles.
    public static let fontHero = Font.system(size: 40, weight: .bold, design: .serif)
    
    /// Main headings (like recipes/projects titles) using an elegant serif.
    public static let fontHeading = Font.system(size: 28, weight: .bold, design: .serif)
    
    /// Subheadings.
    public static let fontSubheading = Font.system(size: 20, weight: .semibold, design: .default)
    
    /// Body text using a clean, readable default system font (San Francisco).
    public static let fontBody = Font.system(size: 16, weight: .regular, design: .default)
    
    /// Captions.
    public static let fontCaption = Font.system(size: 14, weight: .medium, design: .default)
}

// Helper extension to initialize Color from Hex strings
extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hexString.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
