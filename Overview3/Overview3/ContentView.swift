//
//  ContentView.swift
//  Overview3
//
//  Created by Johel Zarco on 09/11/22.
//

import SwiftUI

// Custom  modifiers:
struct titleMod : ViewModifier{
    func body(content: Content) -> some View {
        content.font(.largeTitle).fontWeight(.heavy).shadow(radius: 5)
    }
}
// usually it's a good idea to wrap up the mod into an extension
extension View{
    func titleStyle() -> some View{
        modifier(titleMod())
    }
}
// "Tip: Often folks wonder when it’s better to add a custom view modifier versus just adding a new method to View, and really it comes down to one main reason: custom view modifiers can have their own stored properties, whereas extensions to View cannot"

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
            Text("Felicity").modifier(titleMod())
            Text("Katherine").titleStyle()
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
