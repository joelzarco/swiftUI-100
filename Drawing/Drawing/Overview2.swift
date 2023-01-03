//
//  Overview2.swift
//  Drawing
//
//  Created by Johel Zarco on 03/01/23.
//

import SwiftUI

struct Overview2: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("FelicityJones"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 25)
            .frame(width : 300, height: 200)
    }
}

//struct Overview2_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview2()
//    }
//}
