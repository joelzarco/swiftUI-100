//
//  ContentView.swift
//  weSplit
//
//  Created by Johel Zarco on 26/10/22.
//

import SwiftUI

struct ContentView: View { // structs are inmutable
    // Views depend on their state usually in swiftUI, funny-weird
    @State private var tapCount = 0
    @State private var name = ""
    var body: some View {

        NavigationView{
            Form{ // scrollable but does not respect safe area
                // up to 10 elements in Form
                //In order to have more elements, we group them or section
                Group{// No changes in style
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section{// adds divider
                    Text("Hello, world!")

                }
                Button("Tap count : \(tapCount)"){
                    tapCount += 1
                }
                Section{
                    TextField("Enter your name: ", text: $name)// $two way binding needed in here, read and write properties
                    Text("Your name is: \(name)")
                }
                
            }
                .navigationTitle("SwiftUI-100")
                .navigationBarTitleDisplayMode(.inline)//.inline makes it smaller
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
