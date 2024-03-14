import Foundation

class HomePresenter {
    weak var viewModel: HomeViewModel?
    
    func presentMatches(response: HomeModels.Response) {
        viewModel?.matchedStrings = response.matches
    }
    
    func presentError(error: String) {
        // Optionally handle the error, e.g., by updating the ViewModel
        print(error) // For simplicity, just printing the error
    }
}
