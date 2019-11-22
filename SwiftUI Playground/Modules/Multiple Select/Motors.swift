//
//  Motors.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

enum Motors {
    case singleMotorRwd
    case dualMotorAwd
    case triMotorAwd
}

extension Motors {
    var description: String {
        switch self {
        case .singleMotorRwd: return "Single Motor RWD"
        case .dualMotorAwd: return "Dual Motor AWD"
        case .triMotorAwd: return "Tri Motor AWD"
        }
    }
}

extension Motors: CaseIterable, Identifiable {
    var id: Motors {
        self
    }
}
