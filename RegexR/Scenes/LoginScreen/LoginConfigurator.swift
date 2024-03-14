struct LoginConfigurator {
    static func configure() -> LoginView {
        let viewModel = LoginViewModel()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        
        viewModel.setup(interactor: interactor)
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return LoginView(viewModel: viewModel)
    }
}
