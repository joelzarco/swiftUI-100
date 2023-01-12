//
//  Overview5.swift
//  Drawing
//
//  Created by Johel Zarco on 07/01/23.
//

import SwiftUI

struct Trapezoid : Shape{
    var insetAmount : Double
    
    var animatableData: Double{
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Overview5: View {
    @State private var insetValue = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetValue)
            .fill(.pink)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation { // with this closure swiftCompiler animation is NOT visible
                    insetValue = Double.random(in: 10...90)
                        // inset value must be set as animatableData type
                }
            }
    }
}

//struct Overview5_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview5()
//    }
//}
