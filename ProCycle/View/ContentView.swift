//
//  ContentView.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var circleFrame: CGFloat = 450
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cycles: FetchedResults<CycleInfos>
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
                CircularProgressView(circleFrame: $circleFrame)
                    .onAppear {
                    let cycleInfo = CycleInfos(context: moc)
                    cycleInfo.phaseDescription = "a"
                    cycleInfo.phaseExpandedDescription = "ab"
                    cycleInfo.phaseName = "c"
                    try? moc.save()

                    
                }
                TextField ("dias que fazem da ultima", text: $daysAfterMenstruation)
                    .padding()
                TextField ("duração media", text: $averageDuration)
                    .padding()
                TextField ("duraçao do ciclo", text: $averageCycle)
                    .padding()
            }
            Button("criar evento", action: {
//                startDate -= Double(daysAfterMenstruation)!*24*3600
//                endDate = startDate + Double(averageDuration)!*24*3600
//                calendar.createEvent(title: "", startDate: startDate, endDate:endDate)
                calendar.firstLoadElementsToCalendar(daysBefore: Int(daysAfterMenstruation)!, averageMenstruationDuration: Int(averageDuration)!, averageCycleDuration: Int(averageCycle)!)
            })
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
