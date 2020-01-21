//
//  UserDefault.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T: PropertyListValue> {
    let key: Key

    var wrappedValue: T? {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}
