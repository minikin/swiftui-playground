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
                PlaygroundCell(title: "Sleep More", icon: "clock", detailsView: SleepCalculatorView())
								PlaygroundCell(title: "Multiple Select", icon: "list.bullet", detailsView: SleepCalculatorView())
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("SwiftUI Playground")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
