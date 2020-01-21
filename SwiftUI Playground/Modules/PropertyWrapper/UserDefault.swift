//
//  UserDefault.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<Value: PropertyListValue> {
    let key: Key
    let defaultValue: Value
    var userDefaults: UserDefaults

    init(_ key: Key, defaultValue: Value, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }

    var wrappedValue: Value {
        get { userDefaults.object(forKey: key.rawValue) as? Value ?? defaultValue }
        set { userDefaults.set(newValue, forKey: key.rawValue) }
    }
}
