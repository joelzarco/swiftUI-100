//
//  AddView.swift
//  iExpense
//
//  Created by Johel Zarco on 23/12/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var amountString = ""
    
    @Environment(\.dismiss) var dismissAddView
    
    // add will be observed/modified not created every time plus button is tapped
    @ObservedObject var expenses : Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                // simplyfied to remove 0.00 placeholder
                TextField("Amount", text: $amountString)
                    .keyboardType(.decimalPad)
                    
                
            } // Form
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: Double(amountString) ?? 0.0)
                    expenses.items.append(item)
                    dismissAddView()
                }
            }
        } // Nav
    } // someV
}

 
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
