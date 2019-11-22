//
//  MotorPickerView.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct MotorPickerView: View {
    @State private var selections = [Motors]()
    @ObservedObject var preferedMotors: PreferedMotors
    @Environment(\.presentationMode) var presentationMode

    init(_ preferedMotors: PreferedMotors) {
        self.preferedMotors = preferedMotors
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Choose engine types")) {
                    ForEach(Motors.allCases) { item in
                        SelectableRow(title: item.description, isSelected: self.selections.contains(item)) {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            } else {
                                self.selections.append(item)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: { self.selections = self.preferedMotors.motors })
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Engine Types", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.preferedMotors.motors = self.selections
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("OK")
            })
        }
    }
}

// struct MotorPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MotorPickerView([])
//    }
// }
