//
//  Mock.swift
//  AppTests
//
//  Created by Perso on 4/8/24.
//

import Foundation
@testable import App

struct MockForecastDTO {
    static let itemsDTO = [
        ForecastItemDTO(day: "1", description: "Sunny", sunrise: 3600, sunset: 12000, chanceRain: 0.5, high: 1, low: 1, type: "sunny"),
        ForecastItemDTO(day: "2", description: "Rainy", sunrise: 3600, sunset: 12000, chanceRain: 0.5, high: 1, low: 1, type: "rain")
    ]
    static let items: ForecastItems = [
        ForecastItem(dto: itemsDTO[0]),
        ForecastItem(dto: itemsDTO[1])
    ]
}
