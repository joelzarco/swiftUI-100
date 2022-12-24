//
//  savingUserDefaults.swift
//  iExpense
//
//  Created by Johel Zarco on 22/12/22.
//

import SwiftUI

// conform to codable in order to save in userDefaults
struct MyUser : Codable{
    let firstName : String
    let lastName : String
}

struct savingUserDefaults: View {
    //
    @State private var myUser = MyUser(firstName: "Felicity", lastName: "Johnes")
    
    // fit for saving user preferences. key is case sensitive
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    // @AppStorage is another option, very similar functionality, onle line of code less
    @AppStorage("counter") private var counter = 0
    
    var body: some View {
        VStack{
            Button("Tap count: \(tapCount)"){
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            
            Button("Counter : \(counter)"){
                counter += 1
            }
            .padding(.vertical)
            .foregroundColor(.white)
            Button("Save user"){
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(myUser){
                    UserDefaults.standard.set(data, forKey: "MyUserData")
                }
            }
            .padding(.vertical)
            .foregroundColor(.pink)
        }

    }
}

//struct savingUserDefaults_Previews: PreviewProvider {
//    static var previews: some View {
//        savingUserDefaults()
//    }
//}
