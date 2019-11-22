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
    @State private var selectedItem = 0
    @ObservedObject var preferedMotors = PreferedMotors()

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
                        ForEach(1 ... 10, id: \.self) {
                            Text("\($0)")
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
