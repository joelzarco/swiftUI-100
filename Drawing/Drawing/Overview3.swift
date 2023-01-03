//
//  Overview3.swift
//  Drawing
//
//  Created by Johel Zarco on 03/01/23.
//

import SwiftUI

struct Overview3: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack{
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
        }
    }
}

//struct Overview3_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview3()
//    }
//}
