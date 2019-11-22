//
//  PreferedEngines.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Combine

final class PreferedMotors: ObservableObject {
    @Published var motors = [Motors]()
}
