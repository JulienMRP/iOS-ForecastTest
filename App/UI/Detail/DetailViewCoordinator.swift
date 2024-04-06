//
//  DetailViewCoordinator.swift
//  App
//
//

import Foundation
import UIKit

class DetailViewCoordinator {
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?
    
    public func start(with forecastItem: ForecastItem) {
        let viewModel = DetailViewModel(forecastItem: forecastItem)
        let viewController = DetailViewController(viewModel: viewModel)
        self.viewController = viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
