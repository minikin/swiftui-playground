//
//  MultipleSelect.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 22.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct MultipleSelect: View {
    @State private var showLanguageSheet = false
    @State private var selectedItem = 0
    @ObservedObject var preferedEngines = PreferedEngines()

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Types").font(.caption)) {
                    Button(action: {
                        self.showLanguageSheet.toggle()
                    }) {
                        HStack {
                            Text("Select multiply items").foregroundColor(Color.black)
                            Spacer()
                            Text("\(preferedEngines.motors.count)")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.body)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(UIColor.systemGray4))
                                .font(Font.body.weight(.medium))
                        }
                    }
                    .sheet(isPresented: $showLanguageSheet) {
                        MotorPickerView(self.preferedEngines)
                    }

                    Picker(selection: $selectedItem, label: Text("Select one item")) {
                        ForEach(0 ..< 10) { x in
                            Text("\(x)")
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
