//
//  ContentView.swift
//  Aminations-Overview
//
//  Created by Johel Zarco on 24/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var amount = 1.0
    @State private var StepAnimation = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Button("Heart beat"){
                print("heart beat")
            }
            .padding(50)
            .background(.pink)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(amount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1).repeatForever(autoreverses : false),
                        value: amount
                    )
            ).onAppear{
                amount = 2
            }
            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
            
            Button("Tap me"){
                print("Button scaled: \(animationAmount)")
                animationAmount += 0.2
            }.padding(30)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
            // implicit animation: pre define exactly what will be animated tied to a @State property
                .scaleEffect(animationAmount)
                .blur(radius: (animationAmount - 1) * 3)
//                .animation(.interactiveSpring(), value: animationAmount) // looks cool!
//                .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true) // .repeatForever(autoreverses : true)
                    , value: animationAmount)
            // animations become a function of the State in swiftUI
            Spacer()
            // firing animation with stepper bind property
            Stepper("Scale ammount: ", value : $StepAnimation.animation(), in: 1...5)
            Spacer()
            Button("Step"){
                StepAnimation += 0.2
            }.padding(50)
                .background(.cyan)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(StepAnimation)
            Spacer()
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
