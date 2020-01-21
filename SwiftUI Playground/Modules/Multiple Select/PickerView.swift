//
//  PickerViewswift.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedItem = Color.clear
    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        Picker(selection: $selectedItem, label: Text("Select one item")) {
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
