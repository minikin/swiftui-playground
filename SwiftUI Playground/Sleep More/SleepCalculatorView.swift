//
//  SleepCalculatorView.swift
//  SwiftUI Playground
//
//  Created by Sasha Prokhorenko on 21.11.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct SleepCalculatorView: View {
    @State private var wakeUp = defaultTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    private static var defaultTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }

    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want tp wake up?").font(.headline)
                    DatePicker("Please enter time",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep").font(.headline)

                    Stepper(value: $sleepAmount, in: 4 ... 12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake").font(.headline)
                    Stepper(value: $coffeeAmount, in: 1 ... 20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
							
                Button(action: calculateBedtime) {
									Text("Calculate").fontWeight(.heavy)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
							}

            }.navigationBarTitle("Sleep More")
        }
    }

    private func calculateBedtime() {
        let sleepModel = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60

        do {
            let prediction = try sleepModel.prediction(wake: Double(hour + minute),
                                                       estimatedSleep: sleepAmount,
                                                       coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertTitle = "Your ideal bedtime is ..."
            alertMessage = formatter.string(from: sleepTime)

        } catch {
            alertTitle = "Error"
            alertMessage = "Something went wrong..."
        }

        showingAlert = true
    }
}

struct SleepCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        SleepCalculatorView()
    }
}
