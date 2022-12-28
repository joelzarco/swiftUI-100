//
//  Overview2.swift
//  Moonshot
//
//  Created by Johel Zarco on 27/12/22.
//

import SwiftUI

struct Overview2: View {
    var body: some View {
        NavigationView {
            List(0..<20){ row in
                NavigationLink{ // related content
                    //                DetailViewEx()
                    Text("Detail \(row)")
                    
                } label: {
                    Text("Row : \(row)")
                        .font(.body)
                }
            }
            .navigationTitle("Navigation")
        } // NavV
    }
}


//struct Overview2_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview2()
//    }
//}
