//
//  Overview2.swift
//  CupCakeCorner
//
//  Created by Johel Zarco on 11/01/23.
//

import SwiftUI
// sending and receiving codable data
struct Response : Codable{
    var results : [Result]
}

struct Result : Codable{
    var trackId : Int
    var trackName : String
    var collectionName : String
}
// async/await
struct Overview2: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId){ item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
                    .font(.body)
            } //VS
        } //L
        .task {
            await loadData()
        }
    } // someV
    
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else{
            print("invalid url")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            // parse json
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        }
        catch{
            print("Invalid data")
        }
        
    }
    
}

//struct Overview2_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview2()
//    }
//}
