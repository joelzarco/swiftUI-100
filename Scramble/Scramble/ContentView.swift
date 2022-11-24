//
//  ContentView.swift
//  Scramble
//
//  Created by Johel Zarco on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    TextField("Enter your word: ", text: $newWord)
                        .textInputAutocapitalization(.never)// by default no initial Capital letter
                }
                
                Section{
                    ForEach(usedWords, id: \.self){ word in
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
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel){}
            } message: {
                Text(errorMessage)
            }
        } //Nav
    } // someV
    
    func addNewWord(){ // simple validation
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // check at least one char
        guard answer.count > 0 else {return}
        // more validation to come
        guard isOriginal(word: answer) else{
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        guard isPossible(word: answer) else{
            wordError(title: "Word not possible", message: "You can't spell that from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else{
            wordError(title: "Word not recognized", message: "You can't just make them up!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
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
    // validation methods
    func isOriginal(word : String) -> Bool{
        !usedWords.contains(word) // inversed ! to match
    }
    func isPossible(word : String) -> Bool{
        var tempWord = rootWord
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){ // in which position does letter appears
                tempWord.remove(at: pos)
            } else{
                return false
            }
        }
        return true
    }
    
    func isReal(word : String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title : String, message : String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
} // V

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
// first UI iteration, simple word validation
