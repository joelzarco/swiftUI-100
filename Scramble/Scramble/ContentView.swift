//
//  ContentView.swift
//  Scramble
//
//  Created by Johel Zarco on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""

    var body: some View {
        NavigationView{
            List{
                Section{
                    TextField("Enter your word: ", text: $newWord)
                        .textInputAutocapitalization(.never)// by default no initial Capital letter
                }
                
                Section{
                    ForEach(useWords, id: \.self){ word in
                        HStack{ // show word length with SF
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            } //L
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
            .onAppear(perform: startGame)
        } //Nav
    } // someV
    
    func addNewWord(){ // simple validation
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // check at least one char
        guard answer.count > 0 else {return}
        // more validation to come
        withAnimation{
            useWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){ // no dot in ext
            if let startWords = try? String(contentsOf: startWordsURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "something"
                return
            }
        }
        // there was a problem if we got here
        fatalError("Could not load start.txt from bundle")
    }
} // V

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
// first UI iteration, simple word validation
