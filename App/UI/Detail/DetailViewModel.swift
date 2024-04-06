//
//  DetailViewModel.swift
//  App
//
//

import Foundation

class DetailViewModel {
    private(set) var forecastItem: ForecastItem
    
    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }
}
