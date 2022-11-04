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
            Color.primary
            // adpative colors like Color.primary, depends on systems setting's dark mode
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
