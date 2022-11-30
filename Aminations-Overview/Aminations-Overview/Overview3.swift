//
//  Overview3.swift
//  Aminations-Overview
//
//  Created by Johel Zarco on 29/11/22.
//

import SwiftUI

struct Overview3: View {
    @State private var dragAmount = CGSize.zero
    // for second animation
    let letters = Array("Hello K!")
    @State private var enable = false
    @State private var drag = CGSize.zero
    
    var body: some View {
        VStack{
            Spacer()
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // allow to drag frame around and when finished return to its origin instantly
                .offset(dragAmount)
                .gesture(
                    DragGesture().onChanged{ dragAmount = $0.translation}
                        .onEnded{ _ in
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) { // cool spring!
                                dragAmount = .zero
                            }
                        }
                )
    //            .animation(.spring(), value: dragAmount) // smooth's drag and release
            Spacer()
            // really cool animation with little code!
            HStack(spacing : 0){
                ForEach(0..<letters.count){ num in
                   Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(enable ? .teal : .pink)
                        .offset(drag)
                        .animation(
                            .default.delay(Double(num)/10),
                                   value: drag
                        )
                }
            } // HS
            .gesture(
                DragGesture()
                    .onChanged{ drag = $0.translation }
                    .onEnded{_ in
                        drag = .zero
                        enable.toggle()
                    }
            )
            Spacer()
        } // VS
    } // someV
} // V

//struct Overview3_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview3()
//    }
//}
