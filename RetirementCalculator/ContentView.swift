//
//  ContentView.swift
//  RetirementCalculator
//
//  Created by Ranbijay SinghDeo on 02/07/26.
//

import SwiftUI
import AppCenterCrashes
import AppCenterAnalytics

struct ContentView: View {

    @State private var currentAge = ""
    @State private var retirementAge = ""
    @State private var monthlyInvestment = ""
    @State private var expectedReturn = ""
    @State private var currentSavings = ""
    @State private var showCrashAlert =  false
    @State private var retirementValue = ""

    var body: some View {
        NavigationStack {
            Form {

                Section("Retirement Details") {

                    TextField("Current Age", text: $currentAge)
                        .keyboardType(.numberPad)

                    TextField("Retirement Age", text: $retirementAge)
                        .keyboardType(.numberPad)

                    TextField("Monthly Investment", text: $monthlyInvestment)
                        .keyboardType(.decimalPad)

                    TextField("Expected Return (%)", text: $expectedReturn)
                        .keyboardType(.decimalPad)

                    TextField("Current Savings", text: $currentSavings)
                        .keyboardType(.decimalPad)
                }

                Section {

                    Button("Calculate Retirement Value") {
                        calculateRetirement()
                    }
                    .frame(maxWidth: .infinity)
                }

                if !retirementValue.isEmpty {

                    Section("Estimated Retirement Corpus") {

                        Text(retirementValue)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
            } .onAppear {
                if Crashes.hasCrashedInLastSession {
                    showCrashAlert = true
                }
                Analytics.trackEvent("navigated_to_calculator")

            }
            .alert("Previous Crash Detected",
                   isPresented: $showCrashAlert) {

                Button("OK", role: .cancel) { }

            } message: {

                Text("The app crashed during the previous session.")
            }
            .navigationTitle("Retirement Calculator")
        }
    }

    func calculateRetirement() {
//        Crashes.generateTestCrash()
//        let current = Double(currentSavings) ?? 0
//        let monthly = Double(monthlyInvestment) ?? 0
        let age = Double(currentAge) ?? 0
        let retireAge = Double(retirementAge) ?? 0
        let properties = ["age": String(age), "retireAge": String(retireAge)]
//        let annualReturn = Double(expectedReturn) ?? 0
//
//        let years = max(retireAge - age, 0)
//        let investedAmount = monthly * 12 * years
//
//        // Simple dummy calculation
//        let estimatedCorpus = current + investedAmount * (1 + annualReturn / 100)
//
//        retirementValue = String(format: "₹ %.2f", estimatedCorpus)
        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)

    }
}

#Preview {
    ContentView()
}
