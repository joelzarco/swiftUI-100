//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Johel Zarco on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
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
            //-------------------------------------------
            
//            AngularGradient(gradient: Gradient(colors: [.red, .blue, .pink]), center: .center)
            VStack {
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.white)
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
                        .foregroundColor(.white)
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
                        .foregroundColor(.white)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.cyan)
                }
                // BUTTONS
                Button("Button 1"){}
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive){}// destructive make it red
                    .buttonStyle(.bordered)
                Button("Button 3"){}
                    .buttonStyle(.borderedProminent)
                    .tint(.mint) // .tint() rerers to button's background color
                Button("Button 4", role: .destructive){}
                    .buttonStyle(.borderedProminent)
                // custom button
                Button{
                    print("Custom button was tapped")
                }label: {
                    Text("I dare you!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.black)
                }
                // Button with system image
                Button{
                    print("Edit button was tapped")
                }label: {
                    Label("Edit", systemImage: "pencil")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(.black)
                }
                // show alerts in swiftUI should be a funtion of @State
                Button("Initiate sequence", role: .destructive){
                    showAlert = true
                }
                .buttonStyle(.borderedProminent)
                .alert("This is NOT a drill", isPresented: $showAlert){// $ goes back to false automatically
                    Button("Launch", role: .destructive){}
                    Button("Cancel", role: .cancel){}
                } message: {
                    Text("Seek shelter")
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
