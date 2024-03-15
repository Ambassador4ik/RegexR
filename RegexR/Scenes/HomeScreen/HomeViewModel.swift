import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var regex: String = ""
    @Published var stringList: String = ""
    @Published var matchedStrings: [String] = []
    @Published var errorMessage: String = ""
    
    var interactor: HomeInteractor?
    var authManager: AuthManager?
    
    func checkMatches() {
        interactor?.checkMatches(request: HomeModels.Request(regex: regex, stringList: stringList))
    }
}
