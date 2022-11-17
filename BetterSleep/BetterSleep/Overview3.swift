//
//  Overview3.swift
//  BetterSleep
//
//  Created by Johel Zarco on 17/11/22.
//

import SwiftUI
// prework app learning
struct Overview3: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            // stepper a little more precise than sliders
            Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
            // DatePiccker with range with no upper limit defined, only future dates available
            DatePicker("Date: ", selection: $wakeUp, in: Date.now...)
        }
        .padding()
    }
    
    
    func wakeInEight(){
        // better let apple's framework do the hard work like time zones and leap second
        
//        let date = Calendar.current.date(from: components) ?? Date.now // optional, nil coal
        // whe using .dateComponents optional values are returned, needs to safely unwrapp them
//        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        
    }
}

//struct Overview3_Previews: PreviewProvider {
//    static var previews: some View {
//        Overview3()
//    }
//}
