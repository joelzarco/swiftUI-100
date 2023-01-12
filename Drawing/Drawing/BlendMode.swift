//
//  BlendMode.swift
//  Drawing
//
//  Created by Johel Zarco on 04/01/23.
//

import SwiftUI

struct BlendMode: View {
    @State private var amount = 10.0
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

//struct BlendMode_Previews: PreviewProvider {
//    static var previews: some View {
//        BlendMode()
//    }
//}
