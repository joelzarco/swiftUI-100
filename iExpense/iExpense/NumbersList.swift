//
//  NumbersList.swift
//  iExpense
//
//  Created by Johel Zarco on 21/12/22.
//

import SwiftUI

struct NumbersList: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows) // long swipe or partial works
                }
                Button("Add number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                .padding(.bottom)
            } // VS
            .navigationTitle("OnDelete() example")
            .toolbar {
                EditButton() // delete several rows at a time
            }
        } // nav
    } // someV
    
    func removeRows(at offsets : IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

//struct NumbersList_Previews: PreviewProvider {
//    static var previews: some View {
//        NumbersList()
//    }
//}
