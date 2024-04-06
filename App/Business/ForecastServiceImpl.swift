//
//  ForecastServiceImpl.swift
//  App
//
//  Created by Perso on 4/5/24.
//

import Foundation
import Combine
import Swinject
import Global

class ForecastServiceImpl: ForecastService {
    
    var items: CurrentValueSubject<ForecastItems, Never> = CurrentValueSubject([])
    @Inject var forecastNetworkService: ForecastNetworkService

    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        fetchForecastNetworkItems()
    }
    
    private func fetchForecastNetworkItems() {
        forecastNetworkService.getForecast()
            .map() { dtoItems -> ForecastItems in
                dtoItems.map { ForecastItem(dto: $0) }
            }
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error must be handled in a real project")
                    print(error.localizedDescription)
                default:
                    break
                }
            } receiveValue: { [weak self] forecastItems in
                guard let self = self else { return }
                self.items.send(forecastItems)
            }
            .store(in: &cancelBag)
    }
   
    
    
}
