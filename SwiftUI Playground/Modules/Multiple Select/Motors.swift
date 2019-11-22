//
//  Motors.swift
//  SwiftUI Playground
//
//  Created by Developer on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

enum Motors {
    case singleMotorRwd
    case dualMotorAwd
    case triMotorAwd
}

extension Motors: CaseIterable, Identifiable {
    var id: Motors {
        self
    }
}
