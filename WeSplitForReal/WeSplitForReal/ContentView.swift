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
    
    var body: some View {
        Form{
            Section{
                // if format parameter is not included there would be an error, given check amount is a double
                TextField("Amount", value : $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
                // Locale.current.currencyCode ?? "USD", default is $us dollars
                // $checkAmount has two way bindin
            }
            Section{
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
