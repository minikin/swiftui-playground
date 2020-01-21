//
//  PropertyListValue.swift
//  SwiftUI Playground
//
//  Created by Developer on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

import Foundation

protocol PropertyListValue {}

extension Data: PropertyListValue {}

extension String: PropertyListValue {}

extension Date: PropertyListValue {}

extension Bool: PropertyListValue {}

extension Int: PropertyListValue {}

extension Double: PropertyListValue {}

extension Float: PropertyListValue {}

extension Array: PropertyListValue where Element: PropertyListValue {}

extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
