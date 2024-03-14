import HTTPTypes
import Foundation
import HTTPTypesFoundation

protocol SignupBusinessLogic {
    func handleSignup(signupData: SignupModels.UserSignupData) async
}

class SignupInteractor: SignupBusinessLogic {
    var presenter = SignupPresenter()
    
    func handleSignup(signupData: SignupModels.UserSignupData) async {
        let request = HTTPRequest(method: .post, scheme: "http", authority: CommonConstants.apiEndpoint, path: "/auth/signup")
        var response = SignupModels.Response(status: .noContent)
        
        guard let jsonData = try? JSONEncoder().encode(signupData) else { return }
        do {
            let (soyme, resp) = try await URLSession.shared.upload(for: request, from: jsonData)
            response = SignupModels.Response(status: resp.status)
        } catch {}
        
        await presenter.presentSignupResponse(response: response)
    }
}
