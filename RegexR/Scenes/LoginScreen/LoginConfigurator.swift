struct LoginConfigurator {
    static func configure(authManager: AuthManager) -> LoginView {
        let viewModel = LoginViewModel()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        
        viewModel.setup(interactor: interactor, authManager: authManager)
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return LoginView(viewModel: viewModel)
    }
}
