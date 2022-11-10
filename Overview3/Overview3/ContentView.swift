//
//  ContentView.swift
//  Overview3
//
//  Created by Johel Zarco on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    // opaque return type some
    var body: some View {
        
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
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
