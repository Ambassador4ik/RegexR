import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false
    
    var authManager: AuthManager?
    
    private var interactor: SignupBusinessLogic?
    
    func setup(interactor: SignupBusinessLogic, authManager: AuthManager) {
        self.interactor = interactor
        self.authManager = authManager
    }
    
    func signup() async {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Username/Password cannot be empty"
            return
        }
        
        guard password == repeatPassword else {
            errorMessage = "Passwords don't match"
            return
        }
        
        let signupData = SignupModels.UserSignupData(username: username, password: password)
        await interactor?.handleSignup(signupData: signupData)
    }
}
