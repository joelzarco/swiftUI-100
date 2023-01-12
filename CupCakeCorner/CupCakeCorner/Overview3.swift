//
//  Overview3.swift
//  CupCakeCorner
//
//  Created by Johel Zarco on 12/01/23.
//

import SwiftUI

struct Overview3: View {
    // AsycImage with an url
    let urlString : String = "https://hws.dev/img/logo.png"
    var body: some View {
        VStack{
            // compiler does Not know what exactly comes back, so resizable() is NOT available. closure available to fix that
            // scale means like if it where @3x in the asset catalog
            AsyncImage(url: URL(string: urlString)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            Spacer()
            
            AsyncImage(url: URL(string: urlString)){ phase in
                if let image = phase.image{
                    image.resizable()
                        .scaledToFit()
                } else if phase.error != nil{
//                    print(phase.error)
                    Text("error loading the image")
                } else{
                    ProgressView()
                }
            }
            
            
        } //VS
    }
}

//struct Overview3_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview3()
//    }
//}
