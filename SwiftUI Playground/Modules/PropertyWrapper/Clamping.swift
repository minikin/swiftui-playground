//
//  Clamping.swift
//  SwiftUI Playground
//
//  Created by Developer on 21.01.20.
//  Copyright © 2020 Sasha Prokhorenko. All rights reserved.
//

import Foundation

/// struct Solution {
///		@Clamping(0...14)
///		var pH: Double = 7.0
/// }
///
/// let carbonicAcid = Solution(pH: 4.68)
@propertyWrapper
struct Clamping<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue value: Value, _ range: ClosedRange<Value>) {
        precondition(range.contains(value))
        self.value = value
        self.range = range
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
}


///
///struct RGB {
///   @UnitInterval var red: Double
///   @UnitInterval var green: Double
///   @UnitInterval var blue: Double
///}
///
/// let cornflowerBlue = RGB(red: 0.392, green: 0.584, blue: 0.929)
 @propertyWrapper
 struct UnitInterval<Value: FloatingPoint> {
    @Clamping(0...1)
    var wrappedValue: Value = .zero

	init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
 }


