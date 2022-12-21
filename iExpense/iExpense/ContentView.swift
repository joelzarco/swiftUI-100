//
//  ContentView.swift
//  iExpense
//
//  Created by Johel Zarco on 05/12/22.
//

import SwiftUI


struct ContentView: View {
    @State private var showingSheet = false
    @State private var showList = false
    var body: some View {
        Button("Show sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // like popView or .presentIn UIKit
            SecondView(name: "Samantha")
        }
        // ListView
        Button("Show List"){
            showList.toggle()
        }.sheet(isPresented: $showList) {
            NumbersList()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
