import SwiftUI
import HTTPTypes

protocol LoginPresentationLogic {
    func presentLoginResponse(response: LoginModels.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewModel: LoginViewModel?
    
    @MainActor
    func presentLoginResponse(response: LoginModels.Response) {
        if response.status == .ok {
            authManager.login()
        } else {
            let message: String
            switch response.status {
            case .notFound:
                message = "Incorrect Credentials"
            case .internalServerError:
                message = "Server Error"
            default:
                message = "Request Error"
            }
            viewModel?.errorMessage = message
        }
    }
}

