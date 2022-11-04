//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Johel Zarco on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            // Color it's a view itself
//            Color.black.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Color.primary
            // adpative colors like Color.primary, depends on systems setting's dark mode
            // gradients
//            LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom)
            //Gradient with stops
//            LinearGradient(stops: [Gradient.Stop(color: .pink, location: 0.45), Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom) // looks really cool!!!
            // Radial Gradient
            //RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            // ANgular gradient
            AngularGradient(gradient: Gradient(colors: [.red, .blue, .pink]), center: .center)
            VStack {
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.pink)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.cyan)

                }
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.pink)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.cyan)

                }
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.pink)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.cyan)
                }
            }
        }.ignoresSafeArea()
//        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
