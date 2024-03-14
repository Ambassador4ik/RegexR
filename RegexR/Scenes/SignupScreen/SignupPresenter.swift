import SwiftUI
import HTTPTypes

protocol SignupPresentationLogic {
    func presentSignupResponse(response: SignupModels.Response)
}

class SignupPresenter: SignupPresentationLogic {
    weak var viewModel: SignupViewModel?
    
    @MainActor
    func presentSignupResponse(response: SignupModels.Response) {
        if response.status == .ok {
            viewModel?.isAuthenticated = true
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
