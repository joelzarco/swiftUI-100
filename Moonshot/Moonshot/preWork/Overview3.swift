//
//  Overview3.swift
//  Moonshot
//
//  Created by Johel Zarco on 28/12/22.
//

import SwiftUI

struct User : Codable{
    let name : String
    let address : Address
}
struct Address : Codable{
    let street : String
    let city : String
}


struct Overview3: View {
    var body: some View {
        Button("Decode Json"){
            let input = """
            {
            "name" : "Taylor Swift",
            "address" : {
                "street" : "1, Swift avenue",
                "city" : "Nashville TN"
            }
            }
            """
            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: data){
                print(user.address.street)
            }
            
        }
    }
}

//struct Overview3_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview3()
//    }
//}
