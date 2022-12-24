//
//  Expenses.swift
//  iExpense
//
//  Created by Johel Zarco on 23/12/22.
//

import Foundation

class Expenses : ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet{
            // to save items
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // custom init to retrieve
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        print("No items saved/retrieved")
        self.items = []
    }
    
}
