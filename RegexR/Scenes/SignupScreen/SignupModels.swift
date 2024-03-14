import HTTPTypes

enum SignupModels {
    struct UserSignupData: Codable {
        var username: String
        var password: String
    }
    
    struct Response {
        var status: HTTPResponse.Status
        var errorMessage: String?
    }
}
