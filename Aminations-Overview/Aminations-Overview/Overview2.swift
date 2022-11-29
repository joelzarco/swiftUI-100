//
//  Overview2.swift
//  Aminations-Overview
//
//  Created by Johel Zarco on 28/11/22.
//

import SwiftUI

struct Overview2: View {
    @State private var rotationAmount = 0.0
    @State private var animationEnable = false
    
    var body: some View {
        Spacer()
        Button("Hello K"){
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                rotationAmount += 360
            }
        }.padding(30)
            .background(.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAmount), axis: (x : 0, y : 1, z :0)) // full spin around y axis
        Spacer()
        // controlling the animation stack
        // properties declared before .animation() will be modified
        // multiple animations can be defined, BE carefull with ORDER!
        Button("Hello K"){
            animationEnable.toggle()
        }.frame(width: 150, height: 150)
            .background(animationEnable ? .blue : .pink)
            .animation(nil, value: animationEnable) // nil makes the color change instantaneus
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: animationEnable ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 2), value: animationEnable)
        
        Spacer()
    }

}
// explicit animations, animation stack

//struct Overview2_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview2()
//    }
//}
