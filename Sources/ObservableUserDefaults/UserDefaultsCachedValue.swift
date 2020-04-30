//
//  UserDefaultsObservableKeys.swift
//  TestDriver
//
//  Created by Daniel Mandea on 29/04/2020.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

// The marker protocol
public protocol CachedValue {}

extension Data: CachedValue {}
extension String: CachedValue {}
extension Date: CachedValue {}
extension Bool: CachedValue {}
extension Int: CachedValue {}
extension Double: CachedValue {}
extension Float: CachedValue {}
extension Array: CachedValue where Element: CachedValue {}
extension Dictionary: CachedValue where Key == String, Value: CachedValue {}
