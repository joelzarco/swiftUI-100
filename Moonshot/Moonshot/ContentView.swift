//
//  ContentView.swift
//  Moonshot
//
//  Created by Johel Zarco on 27/12/22.
//

import SwiftUI

struct ContentView: View {
    // compiler no longer can infer result type from decoding, must be explicitly defined like [Mission]
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("# of astronauts : \(astronauts.count)")
            Text("# of missions : \(missions.count)")
            
        }
        .padding()
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
