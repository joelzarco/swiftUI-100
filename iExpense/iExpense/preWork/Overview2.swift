//
//  Overview.swift
//  iExpense
//
//  Created by Johel Zarco on 05/12/22.
//

import Foundation
import SwiftUI

// in order for changes be recognizable to SwiftUI while using a class, properties must be wrapped with @Published
// and use @StateObject

class User : ObservableObject{
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct Overview2 : View{
    // @StateObject must be non-private and conform to ObservableObject protocol
    @StateObject var user = User() // when user() is created we use @StateObeject; when read or modified elsewhere use @ObservedObject
    // @State capture every mod on User Struct and changes whole view(mustbe declared as var)
    // if user is declared as class @State property wrapper no longer works :( it's designed for local changes
    //
    var body: some View{
        VStack{
            TextField("First name:", text: $user.firstName)
            TextField("Last name:", text: $user.lastName)
            Text("Your name is : \(user.firstName) \(user.lastName)").font(.headline)
        }
    }
}
