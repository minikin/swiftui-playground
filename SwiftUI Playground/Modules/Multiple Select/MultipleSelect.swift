//
//  MultipleSelect.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct MultipleSelect: View {
    @State private var showMotorsSelection = false
    @State private var selectedItem = Color.clear
    @ObservedObject var preferedMotors = PreferedMotors()
    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Types").font(.caption)) {
                    Button(action: {
                        self.showMotorsSelection.toggle()
                    }) {
                        HStack {
                            Text("Select multiply items").foregroundColor(Color.black)
                            Spacer()
                            Text("\(preferedMotors.motors.count)")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.body)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(UIColor.systemGray4))
                                .font(Font.body.weight(.medium))
                        }
                    }
                    .sheet(isPresented: $showMotorsSelection) {
                        MotorPickerView(self.preferedMotors)
                    }
                    Picker(selection: $selectedItem, label: Text("Select one item")) {
                        ForEach(colors, id: \.self) { color in
                            Text(color.description.capitalized)
                                .padding()
                                .background(color)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Pickers")
    }
}

struct MultipleSelect_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelect()
    }
}
