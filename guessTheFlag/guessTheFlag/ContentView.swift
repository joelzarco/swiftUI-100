//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Johel Zarco on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score : Int = 0
    
    var body: some View {
//        LinearGradient(stops: [Gradient.Stop(color: .pink, location: 0.45), Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom)
        ZStack{
//            Color.cyan.ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing : 30){
                VStack{
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer].capitalized)
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3){ number in
                    Button{
                        // flag was tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
        } //Z
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action : askQuestion)
        }message: {
            Text("Your score is:\(score)")
        }
    } //body
    
    func flagTapped(_ number : Int){
        if(number == correctAnswer){
            scoreTitle = "Correct"
            score += 1
        }else{
            scoreTitle = "Wrong"
        }
        // to show animation
        showingScore = true
    }
    
    func askQuestion(){
        // will not compile unless properties are declared as @State
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
