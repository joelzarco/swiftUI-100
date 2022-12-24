//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Johel Zarco on 23/12/22.
//

import Foundation

struct ExpenseItem : Identifiable, Codable{
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}
