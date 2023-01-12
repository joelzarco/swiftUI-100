//
//  Overview4.swift
//  Drawing
//
//  Created by Johel Zarco on 07/01/23.
//

import SwiftUI

struct Overview4: View {
//    @State private var amount = 0.0
    // blendMode over images
    var body: some View {
        ZStack{
            Image("wagner")
                .resizable()
                .scaledToFit()
                .colorMultiply(.red)
            
//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
//                .blendMode(.darken)
//                .blendMode(.colorBurn)
//                .blendMode(.colorDodge)
//                .blendMode(.screen)
        }
    }
}

//struct Overview4_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview4()
//    }
//}
