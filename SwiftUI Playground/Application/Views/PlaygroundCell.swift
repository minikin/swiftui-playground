//
//  PlaygroundCell.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct PlaygroundCell<Content: View>: View {
		let id: UUID = UUID()
    let title: String
    let icon: String
    let content: () -> Content

    var body: some View {
        NavigationLink(destination: content()) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
        }
    }

    init(title: String, icon: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content
    }
}

struct PlaygroundCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundCell(title: "title", icon: "clock") { Text("Test") }
    }
}
