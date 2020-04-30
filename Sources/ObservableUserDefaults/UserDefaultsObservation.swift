//
//  UserDefaultsObservation.swift
//  TestDriver
//
//  Created by Daniel Mandea on 29/04/2020.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

public class UserDefaultsObservation: NSObject {
    public let key: ObservableKey
    private var onChange: (Any, Any) -> Void

    public init(key: ObservableKey, onChange: @escaping (Any, Any) -> Void) {
        self.onChange = onChange
        self.key = key
        super.init()
        UserDefaults.standard.addObserver(self, forKeyPath: key.rawValue, options: [.old, .new], context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        guard let change = change, object != nil, keyPath == key.rawValue else { return }
        onChange(change[.oldKey] as Any, change[.newKey] as Any)
    }
    
    deinit {
        UserDefaults.standard.removeObserver(self, forKeyPath: key.rawValue, context: nil)
    }
}
