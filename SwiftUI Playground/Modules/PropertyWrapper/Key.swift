//
//  Key.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct Key: RawRepresentable {
    let rawValue: String
}

extension Key: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

extension Key {
    static let isFirstLaunch: Key = "isFirstLaunch"
}
