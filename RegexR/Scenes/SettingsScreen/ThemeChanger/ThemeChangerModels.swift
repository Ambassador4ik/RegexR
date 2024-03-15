import SwiftUI

enum ThemeChangerModels {
    enum Theme: String, CaseIterable {
        case systemDefault = "Same As The System Theme"
        case light = "Light Theme"
        case dark = "Dark Theme"
        
        var colorScheme: ColorScheme? {
            switch self {
            case .systemDefault:
                return nil
            case .light:
                return .light
            case .dark:
                return .dark
            }
        }
    }

}
