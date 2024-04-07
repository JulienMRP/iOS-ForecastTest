//
//  AppModule.swift
//  App
//
//

import Global

public class AppModule: Module {
    public static var shared = AppModule()
    private init() {
        // Singleton
    }

    public func registerServices() {
        if AppEnvironment.shared.environment == .network {
            GlobalContainer.networkContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImpl() }
        } else {
            GlobalContainer.networkContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImplMock() }
        }
        GlobalContainer.defaultContainer.register(ForecastService.self) { _ in ForecastServiceImpl() }
    }
}
