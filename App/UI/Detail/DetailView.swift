//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    let forecastItem: ForecastItem
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(forecastItem: ForecastItem(dto: ForecastItemDTO(day: "1", description: "Sunny", sunrise: 27460, sunset: 63600, chanceRain: 0.1, high: 15, low: 6, type: "sunny")))
    }
}
