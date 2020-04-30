//
//  ObservableUserDefaults.swift
//  TestDriver
//
//  Created by Daniel Mandea on 29/04/2020.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

@propertyWrapper
public class ObservableUserDefaults<T: CachedValue> {
    let key: ObservableKey
    let defaultValue: T
    
    public init(key: ObservableKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get { cached(for: key.rawValue, defaultValue: defaultValue) }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
    
    public var projectedValue: ObservableUserDefaults<T> { return self }
    
    public func observe(change: @escaping (T?, T) -> Void) -> NSObject {
        return UserDefaultsObservation(key: key) { old, new in
            change(old as? T, new as! T)
        }
    }
    
    func cached<T>(for key: String, defaultValue: T) -> T {
        guard let currentValue = UserDefaults.standard.object(forKey: key) as? T else {
            return defaultValue
        }
        return currentValue
    }
}

