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
    private func TintedImage(imageName: String, tintColor: Color) -> some View {
        Image(imageName)
            .tintImage(tintColor)
    }
    
    @ViewBuilder
    private var content: some View {
        VStack {
            weatherView
            temperatureView
            sunView
            rainChanceView
        }.padding(24)
    }
    
    @ViewBuilder
    private var weatherView: some View {
        Container {
            VStack(spacing: 16) {
                Text("Day \(forecastItem.day)")
                    .forecastLabelFont()
                TintedImage(imageName: forecastItem.type,
                            tintColor: .white)
                Text(forecastItem.description)
                    .forecastInfoFont()
            }
        }
    }
    
    @ViewBuilder
    private var sunView: some View {
        HStack {
            Container {
                VStack(spacing: 12) {
                    Text("Sunrise")
                        .forecastLabelFont()
                    TintedImage(imageName: "sunrise",
                                tintColor: .white)
                    Text(forecastItem.sunrise.time)
                        .forecastInfoFont()
                }
            }
            
            Container {
                VStack(spacing: 12) {
                    Text("Sunset")
                        .forecastLabelFont()
                    TintedImage(imageName: "sunset",
                                tintColor: .white)
                    Text(forecastItem.sunset.time)
                        .forecastInfoFont()
                }
            }
        }
        
    }
    
    @ViewBuilder
    private var temperatureView: some View {
        HStack {
            Container {
                VStack {
                    Text("High")
                        .forecastLabelFont()
                    Text(forecastItem.high.temperature)
                        .forecastInfoFont()
                        
                }
            }
            Container {
                VStack {
                    Text("Low")
                        .forecastLabelFont()
                    Text(forecastItem.low.temperature)
                        .forecastInfoFont()
                }
            }
           
        }
        
    }
    
    @ViewBuilder
    private var rainChanceView: some View {
        Container(content: {
            VStack {
                Text("Rain chances")
                    .forecastLabelFont()
                HStack {
                    TintedImage(imageName: "rain", tintColor: .white)
                    Text(forecastItem.chanceRain.percent)
                        .forecastInfoFont()
                }
                
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
            .padding(18)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: GlobalColor.backgroundSecondary ?? .black))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
