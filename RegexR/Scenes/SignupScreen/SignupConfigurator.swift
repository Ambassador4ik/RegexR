struct SignupConfigurator {
    static func configure(authManager: AuthManager) -> SignupView {
        let viewModel = SignupViewModel()
        let presenter = SignupPresenter()
        let interactor = SignupInteractor()
        
        viewModel.setup(interactor: interactor, authManager: authManager)
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return SignupView(viewModel: viewModel)
    }
}
