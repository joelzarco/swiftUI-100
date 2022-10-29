//
//  ContentView.swift
//  weSplit
//
//  Created by Johel Zarco on 26/10/22.
// SIMPLE OVERVIEW OF TOPICS BEFORE BUILDING SPLITTING CHECK'S APP

import SwiftUI

struct ContentView: View { // structs are inmutable
    // Views depend on their state usually in swiftUI, funny-weird
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Felicity"
    
    let students = ["Felicity", "Samantha", "Emiliy", "Daisy", "Geraldine", "Marianne"]
    
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
                Section{
                    Picker("Select an student: ", selection: $selectedStudent){//
                        ForEach(students, id: \.self){// SwiftUI needs to be able to identify each view
                            Text($0)
                        }
                    }
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
