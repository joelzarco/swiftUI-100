//
//  ContentView.swift
//  Overview3
//
//  Created by Johel Zarco on 09/11/22.
//

import SwiftUI
// refactor elements into separate views, DO NOT worry about perfomance!
// easier to reuse
struct CapsuleText: View{
    
    var text : String
    var body: some View{
        Text(text).font(.caption)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())        
    }
}

struct ContentView: View {
    
    @State private var useRedText = false
    // opaque return type some
    var body: some View {
        
        Spacer()
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.primary)
            Text("Hello, world!")
                .foregroundColor(.primary)

        } // order matters when modifying views
        .background(.secondary)
        .padding()
        .background(.tertiary)
        .padding()// frames stack up in given order
        
        Spacer()
        
        // using ternary operator and state to modify properties
        Button("Hello Marianne!"){
            useRedText.toggle()
        }.foregroundColor(useRedText ? .red : .blue) // WTF rule for ternary op What ? True : False
        
        Spacer()
        VStack{
            Text("Felicity")
            Text("Katherine")
            Text("Marianne").font(.largeTitle).fontWeight(.semibold) // child modifier overrides
        }.font(.title) // envoriment modifier, apply to whole group
        // Not all modifiers behave the same, use common sense and read the docs
        CapsuleText(text: "Juliette")
        CapsuleText(text: "Geraldine")
        Spacer()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
