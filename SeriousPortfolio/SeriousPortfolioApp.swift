import SwiftUI

@main
struct SeriousPortfolioApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                // Apply the tint color globally
                .tint(Theme.brandPrimary)
        }
    }
}
