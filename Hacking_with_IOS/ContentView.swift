//
//  ContentView.swift
//  Hacking_with_IOS
//
//  Created by Luiz Gall on 2026-01-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    private var totalPerPerson: Double {
        return (checkAmount + (checkAmount * Double(tipPercentage) / 100.0)) / Double(numberOfPeople)
    }
    
    private let tipOptions: [Int] = [10, 15, 20, 25, 30]
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                }
                
                Section {
                        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section {
                        Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section ("How much would you like to tip?"){
                    Picker("Tip percentage?", selection: $tipPercentage) {
                        ForEach(tipOptions, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    Text("Total per person: \(totalPerPerson)")
                }
            }
        }.navigationTitle("WeSplit")
        
    }
}

#Preview {
    ContentView()
}
