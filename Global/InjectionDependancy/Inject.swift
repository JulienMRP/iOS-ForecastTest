//
//  Inject.swift
//  Global
//
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T

    public init() {
        self.wrappedValue = GlobalContainer.defaultContainer.resolve(T.self)!
    }
}

@propertyWrapper
public struct OptionalInject<T> {
    public var wrappedValue: T?

    public init() {
        self.wrappedValue = GlobalContainer.defaultContainer.resolve(T.self)
    }
}

@propertyWrapper
public struct InjectNetwork<T> {
    public var wrappedValue: T

    public init() {
        self.wrappedValue = GlobalContainer.networkContainer.resolve(T.self)!
    }
}

@propertyWrapper
public struct OptionalInjectNetwork<T> {
    public var wrappedValue: T?

    public init() {
        self.wrappedValue = GlobalContainer.networkContainer.resolve(T.self)
    }
}
