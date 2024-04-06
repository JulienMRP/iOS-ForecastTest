//
//  Environment.swift
//  App
//
//  Created by Perso on 4/6/24.
//

import Foundation

enum Environment {
    case network
    case mock
}

class AppEnvironment {
    public static var shared = AppEnvironment()
    
    var environment: Environment = .mock
    
    func switchEnvironment() {
        environment = environment == .network ? .mock : .network
    }
}
