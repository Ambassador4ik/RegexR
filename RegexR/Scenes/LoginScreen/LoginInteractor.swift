import HTTPTypes
import Foundation
import HTTPTypesFoundation

protocol LoginBusinessLogic {
    func handleLogin(loginData: LoginModels.UserLoginData) async
}

class LoginInteractor: LoginBusinessLogic {
    var presenter = LoginPresenter()
    
    func handleLogin(loginData: LoginModels.UserLoginData) async {
        let request = HTTPRequest(method: .post, scheme: "http", authority: CommonConstants.apiEndpoint, path: "/auth/login")
        var response = LoginModels.Response(status: .noContent)
        
        guard let jsonData = try? JSONEncoder().encode(loginData) else { return }
        do {
            let (_, resp) = try await URLSession.shared.upload(for: request, from: jsonData)
            response = LoginModels.Response(status: resp.status)
        } catch {}
        
        await presenter.presentLoginResponse(response: response)
    }
}
