//
//  ForecastNetworkServiceImplMock.swift
//  App
//
//  Created by Perso on 4/6/24.
//

import Foundation
import Combine

class ForecastNetworkServiceImplMock: ForecastNetworkService {
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        return Bundle.main.url(forResource: "mockData", withExtension: "json")
                   .publisher
                   .tryMap{ string in
                       guard let data = try? Data(contentsOf: string) else {
                           fatalError("Failed to load mock from bundle.")
                       }
                       return data
                   }
                   .decode(type: [ForecastItemDTO].self, decoder: JSONDecoder())
                   .eraseToAnyPublisher()
    }
}
