struct HomeConfigurator {
    static func configure() -> HomeView {
        let viewModel = HomeViewModel()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        viewModel.interactor = interactor
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        
        return HomeView(viewModel: viewModel)
    }
}
