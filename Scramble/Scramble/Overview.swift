//
//  Overview.swift
//  Scramble
//
//  Created by Johel Zarco on 22/11/22.
//

import SwiftUI

struct Overview: View {
    let people = ["Felicity", "Samantha", "Ivonne", "Jessica", "Karla"]
    var body: some View {
        List{ // it is possible to create ros directly in here with something like ForEach(people, id: \.self)
            Section("Section 1"){
                Text("Static row")
                Text("Static row")
            }
            
            Section("Section 2"){
                ForEach(1..<4){
                    Text("Dynamic row \($0)").font(.body)
                }
            }
            Section("Section 3"){
                Text("Static row")
                Text("Static row")
            }
            Section("Section 4"){
                ForEach(people, id: \.self){
                    Text("\($0)")
                }
            }
            
        } //List
    } // someV
} // V

//struct Overview_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}
