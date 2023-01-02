//
//  Shapes.swift
//  Drawing
//
//  Created by Johel Zarco on 01/01/23.
//

import SwiftUI

struct Triangle : Shape{
    // using a rectangle to draw a triangle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Arc : InsettableShape{
    let startAngle : Angle
    let endAngle : Angle
    let clockwise : Bool
    // in order to customize an arc is mos conform to insettable shape
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        // Needs three mods to be look 'natural'
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        return path
    }
    
    func inset(by amount : CGFloat) -> some InsettableShape{
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Shapes: View {
    var body: some View {
//        Triangle()
//            .fill(.pink)
//            .frame(width: 100, height: 100)
        VStack{
            Triangle()
                .stroke(.cyan, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 150, height: 150)
            // iOS uses a diferent coord system, top-left corner centered, so coord's needs to be adjusted
            Arc(startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
                .stroke(.pink, lineWidth: 5)
                .frame(width: 100, height: 100)
            Circle()
//                .stroke(.blue, lineWidth: 20) // takes all available space, line is partly ouside visible area in edges
                .strokeBorder(.blue, lineWidth: 20) // fits exactly in safe area
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                .strokeBorder(.purple, lineWidth: 15) // now Arc can make use of strokeBroder an other methods
        }
    }
}

//struct Shapes_Previews: PreviewProvider {
//    static var previews: some View {
//        Shapes()
//    }
//}
