struct SignupConfigurator {
    static func configure() -> SignupView {
        let viewModel = SignupViewModel()
        let presenter = SignupPresenter()
        let interactor = SignupInteractor()
        
        viewModel.setup(interactor: interactor)
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return SignupView(viewModel: viewModel)
    }
}
