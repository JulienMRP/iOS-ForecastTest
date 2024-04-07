//
//  ForecastServiceImplTest.swift
//  App
//
//  Created by Perso on 4/8/24.
//

import XCTest
import Combine
@testable import App

final class ForecastServiceImplTests: XCTestCase {
    
    var sut: ForecastServiceImpl!
    var mockForecastNetworkService: MockForecastNetworkService!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = ForecastServiceImpl()
        mockForecastNetworkService = MockForecastNetworkService()
        sut.forecastNetworkService = mockForecastNetworkService
    }
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        sut = nil
        mockForecastNetworkService = nil
        super.tearDown()
    }
    
    func testFetchForecastNetworkItems() {
        let expectedItems = MockForecastDTO.items
        mockForecastNetworkService.getForecastFakeResult = Just([MockForecastDTO.itemsDTO[0], MockForecastDTO.itemsDTO[1]]).setFailureType(to: Error.self).eraseToAnyPublisher()
        
               
        sut.fetchForecastNetworkItems()
        
        let expectation = XCTestExpectation(description: "Wait for forecast items to be received")
        sut.items.sink { receivedItems in
            XCTAssertEqual(receivedItems, expectedItems)
            expectation.fulfill()
        }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
    }
}

class MockForecastNetworkService: ForecastNetworkService {
    var getForecastFakeResult: AnyPublisher<[ForecastItemDTO], Error>?
    
    func getForecast() -> AnyPublisher<[App.ForecastItemDTO], Error> {
        return getForecastFakeResult ?? Empty().eraseToAnyPublisher()
    }
    
}

