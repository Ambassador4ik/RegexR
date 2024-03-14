import Foundation

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    
    init() {        
        isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
    }
    
    func login() {
        UserDefaults.standard.set(true, forKey: "isAuthenticated")
        isAuthenticated = true
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "isAuthenticated")
        isAuthenticated = false
    }
}
