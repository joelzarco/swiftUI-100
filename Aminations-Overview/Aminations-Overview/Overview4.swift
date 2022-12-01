//
//  Overview4.swift
//  Aminations-Overview
//
//  Created by Johel Zarco on 30/11/22.
//

import SwiftUI

// building custom transitions using ViewModifier
struct CornerRotateModifier : ViewModifier{
    let amount : Double
    let anchor : UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}
// better code it inside an extension for easier access
extension AnyTransition{
    static var pivot : AnyTransition{
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct Overview4: View {
    @State private var isShowingPink = false
    @State private var isAnimating = false
    
    var body: some View {
        VStack{
            Spacer()
            Button("Hey stranger!"){
                withAnimation{
                    isShowingPink.toggle()
                }
            }
            if (isShowingPink){
                Rectangle()
                    .fill(.pink)
                    .frame(width: 100, height: 100)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity)) // mix two transitions
            }
            Spacer()
            ZStack{
                Rectangle()
                    .fill(.teal)
                    .frame(width: 150, height: 150)
                    
                if(isAnimating){
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 150, height: 150)
                        .transition(.pivot)
                }
            }.onTapGesture {
                withAnimation {
                    isAnimating.toggle()
                }
            }
            Spacer()
            
        } // VStack
    } // someV
}

//struct Overview4_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview4()
//    }
//}
