//
//  ContentView.swift
//  Drawing
//
//  Created by Johel Zarco on 01/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path{ path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
            
        }
//        .fill(.pink)
//        .stroke(.pink, lineWidth: 10) //last line does NOT look fully connected
        .stroke(.pink, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)) // edge rounded pink triangle
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
