//
//  Storage.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

/// var storage = Storage()
///
/// storage.isFirstLaunch = true
///
/// print(storage.isFirstLaunch)
///
struct Storage {
    @UserDefault(.isFirstLaunch, defaultValue: false)
    var isFirstLaunch: Bool
}
