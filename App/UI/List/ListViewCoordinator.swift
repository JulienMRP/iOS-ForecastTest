//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()
        viewModel.showDetail = showDetailView(for:)
        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    private func showDetailView(for forecastItem: ForecastItem) {
        let detailCoordinator = DetailViewCoordinator()
        detailCoordinator.navigationController = self.navigationController
        detailCoordinator.start(with: forecastItem)
    }
}
