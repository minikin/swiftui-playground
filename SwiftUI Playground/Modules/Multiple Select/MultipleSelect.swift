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
    @ObservedObject var preferedMotors = PreferedMotors()

    var body: some View {
        Form {
            Section(header: Text("Types").font(.caption)) {
                configureMotorPickerView()
                // PickerView()
            }
            .navigationBarTitle("Pickers")
        }
    }

    private func configureMotorPickerView() -> some View {
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
    }
}

struct MultipleSelect_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelect()
    }
}
