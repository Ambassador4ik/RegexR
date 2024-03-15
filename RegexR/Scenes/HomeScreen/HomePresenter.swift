import Foundation

class HomePresenter {
    weak var viewModel: HomeViewModel?
    
    func presentMatches(response: HomeModels.Response) {
        viewModel?.matchedStrings = response.matches
        viewModel?.errorMessage = ""
    }
    
    func presentError(error: String) {
        viewModel?.errorMessage = error
    }
}
