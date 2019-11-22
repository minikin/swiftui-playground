//
//  ContentView.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                PlaygroundCell(title: "Sleep More", icon: "clock") { SleepCalculatorView() }
                PlaygroundCell(title: "Multiple Select", icon: "car") { MultipleSelect() }
            }.listStyle(GroupedListStyle()).navigationBarTitle("SwiftUI Examples").onAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
