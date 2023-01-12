//
//  Overview.swift
//  CupCakeCorner
//
//  Created by Johel Zarco on 11/01/23.
//

import SwiftUI

class User : Codable, ObservableObject{
    // codable and @Pub no longer compile. @Published is a struct itself
    // to encode/decode @Published propeties wrap them into an enum and implement requiered methods
    enum CodingKeys : CodingKey{
        case name
    }
    @Published var name = "Felicity Johnes"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }

}

struct Overview: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct Overview_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}
