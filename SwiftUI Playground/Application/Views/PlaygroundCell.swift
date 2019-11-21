//
//  PlaygroundCell.swift
//  SwiftUI Playground
//
//  Created by Developer on 21.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct PlaygroundCell<Content: View>: View {
    let title: String
    let detailsView: Content

    var body: some View {
        NavigationLink(destination: detailsView) { Text(title) }
    }

    init(title: String, detailsView: Content) {
        self.title = title
        self.detailsView = detailsView
    }
}

struct PlaygroundCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundCell(title: "title", detailsView: Text("Test"))
    }
}
