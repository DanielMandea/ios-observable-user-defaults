//
//  ObservableKey.swift
//  TestDriver
//
//  Created by Daniel Mandea on 29/04/2020.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

public struct ObservableKey: RawRepresentable {
    public let rawValue: String
}

extension ObservableKey: ExpressibleByStringLiteral {
    public init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}
