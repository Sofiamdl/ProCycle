//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calendar = CalendarViewModel()
    @State var daysAfterMenstruation = "15"
    @State var averageDuration = "5"
    @State var averageCycle = "28"
    @State var startDate = Date.now
    @State var endDate = Date()
    var body: some View {
        VStack {
            Slider()
            VStack {
                TextField ("dias que fazem da ultima", text: $daysAfterMenstruation)
                    .padding()
                TextField ("duração media", text: $averageDuration)
                    .padding()
                TextField ("duraçao do ciclo", text: $averageCycle)
                    .padding()
            }
            Button("criar evento", action: {
                calendar.firstLoadElementsToCalendar(daysBefore: Int(daysAfterMenstruation)!, averageMenstruationDuration: Int(averageDuration)!, averageCycleDuration: Int(averageCycle)!)
            })
        }
        .alert("Você só pode marcar em dias que já passaram", isPresented: $calendar.showingAlert) {
                    Button("OK", role: .cancel) { }
                }
        .environmentObject(calendar)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
