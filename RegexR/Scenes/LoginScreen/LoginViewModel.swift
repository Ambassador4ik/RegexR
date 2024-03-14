import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false
    
    private var interactor: LoginBusinessLogic?
    
    func setup(interactor: LoginBusinessLogic) {
        self.interactor = interactor
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
