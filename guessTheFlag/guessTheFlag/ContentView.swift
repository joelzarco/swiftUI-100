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
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            // experimenting with radiantGradients
            RadialGradient(stops: [.init(color: Color(red : 0.1, green: 0.2, blue:0.45), location: 0.3),
                                   .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing : 15){
                    VStack{
                        Text("Tap the flag of:")
                            .foregroundStyle(.secondary) // very light change to gray
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer].capitalized)
                            .foregroundColor(.primary)
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
                } // embV
                // semi translucent rounded rect frame
                .frame(maxWidth : .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)// thanslucity?
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score : \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }// outerV
            .padding() // to push it a little away from the screen edges
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
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        print("AskQuestion function called")
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
