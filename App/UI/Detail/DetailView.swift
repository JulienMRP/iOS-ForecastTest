//
//  DetailView.swift
//  App
//
//

import SwiftUI
import GlobalUI

struct DetailView: View {
    let forecastItem: ForecastItem
    
    var body: some View {
        ZStack {
            Color(GlobalColor.backgroundColor ?? .blue)
                .ignoresSafeArea()
            content
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack {
            Container {
                Image(forecastItem.type)
                    .tint(.white)
            }
            temperatureView
            sunView
            rainChanceView
        }
    }
    
    @ViewBuilder
    private var sunView: some View {
        Container {
            HStack {
                Text(forecastItem.sunrise.time)
                    .foregroundStyle(.white)
                Text(forecastItem.sunset.time)
                    .foregroundStyle(.white)
            }
        }
        
    }
    
    @ViewBuilder
    private var temperatureView: some View {
        Container {
            HStack {
                Text(forecastItem.high.temperature)
                    .foregroundStyle(.white)
                Text(forecastItem.low.temperature)
                    .foregroundStyle(.white)
            }
        }
       
    }
    
    @ViewBuilder
    private var rainChanceView: some View {
        Container(content: {
            HStack {
                Text(forecastItem.chanceRain.percent)
                    .foregroundStyle(.white)
            }
        })
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(forecastItem: ForecastItem(dto: ForecastItemDTO(day: "1", description: "Sunny", sunrise: 27460, sunset: 63600, chanceRain: 0.1, high: 15, low: 6, type: "sunny")))
    }
}

struct Container<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(12)
            .background(Color(uiColor: GlobalColor.backgroundSecondary ?? .black))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
