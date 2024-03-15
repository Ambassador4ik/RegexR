struct HomeConfigurator {
    static func configure(authManager: AuthManager) -> HomeView {
        let viewModel = HomeViewModel()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        viewModel.interactor = interactor
        viewModel.authManager = authManager
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        
        return HomeView(viewModel: viewModel)
    }
}
