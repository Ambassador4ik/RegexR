import SwiftUI
import SwiftData


@main
struct RegexRApp: App {
    @StateObject private var authManager = AuthManager()
    
    func resetUserDefaults() {
            if let bundleID = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundleID)
            }
        }
    init() {
        // For development purposes
        //UserDefaults.standard.set(false, forKey: "isAuthenticated")
        UserDefaults.standard.set(true, forKey: "isAuthenticated") // Pass to HomeView
    }
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authManager)
        }
        .modelContainer(sharedModelContainer)
    }
}
