//
//  Overview.swift
//  Moonshot
//
//  Created by Johel Zarco on 27/12/22.
//

import SwiftUI

struct Overview: View {
    var body: some View {
//        Image("banksy")
//            .resizable()
//            .scaledToFit()// fin in containner
////            .scaledToFill()
//            .frame(width: 500, height: 500)
        VStack{
            GeometryReader{ geo in
                Image("banksy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.8) // 80% of available width
                    // another frame containner to center the image
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            Spacer()
            ScrollView{
                LazyVStack{
                    ForEach(0..<20){
                        // All 20 rows are created at launch, can be time consuming and bad practice
                        // lazy type is recommended. LazyVStack takes all available space as oposed to regular VS
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity) // to take all avaliable width
            } // Scroll
            
        } // VS
    }
}

//struct Overview_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview()
//    }
//}
