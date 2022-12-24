//
//  ContentView.swift
//  iExpense
//
//  Created by Johel Zarco on 05/12/22.
//

import SwiftUI


struct ContentView: View {
    // @StateObject in order to watch for changes, for classses!
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List{
                // "id: \.id" no longer needed given ExpenseItem comforms to identifiable
                ForEach(expenses.items){ item in
//                    Text(item.name)
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.footnote)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    } //HS
                } // forE
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    // expense for testing list
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 9.99)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            } // tool
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses) // expenses is a shared object
            }
        } // nav
    } // someV
    func removeItems(at offsets : IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
