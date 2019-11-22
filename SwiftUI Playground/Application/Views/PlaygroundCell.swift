//
//  PlaygroundCell.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct PlaygroundCell<Content: View>: View {
    let title: String
    let icon: String
    let detailsView: Content

    var body: some View {
        NavigationLink(destination: detailsView) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
        }
    }

    init(title: String, icon: String, detailsView: Content) {
        self.title = title
        self.icon = icon
        self.detailsView = detailsView
    }
}

struct PlaygroundCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundCell(title: "title", icon: "clock", detailsView: Text("Test"))
    }
}
