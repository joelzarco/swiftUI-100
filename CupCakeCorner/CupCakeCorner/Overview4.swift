//
//  Overview4.swift
//  CupCakeCorner
//
//  Created by Johel Zarco on 12/01/23.
//

import SwiftUI

struct Overview4: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm : Bool{
        // bare minimun validation
        username.count < 5 || email.count < 5
    }
    var body: some View {

        Form{
            Section{
                TextField("username", text: $username)
                TextField("Email", text: $email)
            }
            Section{
                Button("Create account"){
                    print("Creating account ...")
                }
            }.disabled(username.isEmpty || email.isEmpty)
            
        }
    }
}

//struct Overview4_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview4()
//    }
//}
