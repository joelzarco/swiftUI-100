//
//  ContentView.swift
//  WeSplitForReal
//
//  Created by Johel Zarco on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    // @State reloads body view every time State changes
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double{
        let peopleCount = Double(numberOfPeople + 2) // given picker range is NOT zero based
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        //  needs to be embebed in NavigationView in order to show title
        NavigationView{
            Form{
                Section{
                    // if format parameter is not included there would be an error, given check amount is a double
                    TextField("Amount", value : $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
                    // Locale.current.currencyCode ?? "USD", default is $us dollars
                    // $checkAmount has two way binding
                    Picker("Number of people", selection: $numberOfPeople){ // picker works great just
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }
                }
                // sections can have header and footer notes to explain their selfs
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip?")
                }
                
                Section{
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }.navigationTitle("WeSplit")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
