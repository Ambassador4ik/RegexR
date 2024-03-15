import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false
    
    var authManager: AuthManager?
    
    private var interactor: LoginBusinessLogic?
    
    func setup(interactor: LoginBusinessLogic, authManager: AuthManager) {
        self.interactor = interactor
        self.authManager = authManager
    }
    
    func login() async {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Username/Password cannot be empty"
            return
        }
        
        let loginData = LoginModels.UserLoginData(username: username, password: password)
        await interactor?.handleLogin(loginData: loginData)
    }
}
