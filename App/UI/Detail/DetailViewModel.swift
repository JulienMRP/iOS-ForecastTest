//
//  DetailViewModel.swift
//  App
//
//

import Foundation

class DetailViewModel {
    private(set) var forecastItem: ForecastItem
    
    var title: String {
        "\(forecastItem.day) - \(forecastItem.description)"
    }
    
    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }
}
