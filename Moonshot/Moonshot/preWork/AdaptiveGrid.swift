//
//  AdaptiveGrid.swift
//  Moonshot
//
//  Created by Johel Zarco on 28/12/22.
//

import Foundation
import SwiftUI

struct AdaptiveGrid : View{
    let layout  = [GridItem(.adaptive(minimum: 80, maximum: 120))]
    var body: some View{
        ScrollView{
            LazyVGrid(columns: layout){
                ForEach(0..<100){
                    Text("Item \($0)")
                }
            }
        }
    }
    
}

