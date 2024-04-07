//
//  GlobalContainer.swift
//  Global
//
//


import Foundation
import Swinject

/// Global container for services registration
/// Useful to have an Inject property wrapper
public final class GlobalContainer {
    public static var defaultContainer = Container()
    public static var networkContainer = Container()

    public static func resetNetworkContainer() {
        networkContainer.removeAll()
    }
}
