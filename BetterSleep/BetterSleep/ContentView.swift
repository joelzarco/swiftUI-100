//
//  ContentView.swift
//  BetterSleep
//
//  Created by Johel Zarco on 15/11/22.
//
import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // computed property to improve default wakeUptime, make it static in order to be read anywhere
    static var defaultWakeTime : Date{
        var components = DateComponents()
        components.hour = 6
        components.minute = 30
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView{
            Form{ // looks better with forms
                
                VStack(alignment: .center, spacing: 0){
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()

                }
                VStack(alignment: .leading, spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0){
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
            } //Form
            // trailing button for result
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedTime) // automatically to top right corner
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("OK"){ }
            } message: {
                Text(alertMessage)
            }
        } //nav
    } // someV
    
    func calculateBedTime(){
        print("Calculate tapped")
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            // retrieve parameters
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 // in seconds
            let minute = (components.minute ?? 0) * 60 // in case it is nil
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
//            prediction.actualSleep is a double of seconds which is not user friendly, needs to be converted into sugested hour to go to sleep
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch{
            // something went terrible wrong!
            alertTitle = "Error"
            alertMessage = "something went terrible wrong :("
        }
        //
        showingAlert = true
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
