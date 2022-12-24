//
//  SecondView.swift
//  iExpense
//
//  Created by Johel Zarco on 21/12/22.
//

import SwiftUI

struct SecondView : View{
    @Environment(\.dismiss) var dismiss // catch input from user
    
    let name : String
    var body : some View{
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello \(name)")
            Button("Dismiss"){
                dismiss()
            }
        }
        .padding()
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
