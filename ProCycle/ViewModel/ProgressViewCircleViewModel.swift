//
//  ProgressViewCircleViewModel.swift
//  ProCycle
//
//  Created by mvitoriapereirac on 26/05/23.
//

import SwiftUI
class ProgressCircleViewModel: ObservableObject {
    @Published var cycleDuration: Int
    @Published var periodDuration: Int
    @Published var accumulatedDegrees: Double
    @Published var degreesPerDay: Double
    @Published var todayInCycle: Int
    
  
    
    var dateTrack = DateTrack()
    
    init(accumulatedValue: Double = 12.8, aux: Double = 12.8, dateTrack: DateTrack = DateTrack()) {
        @AppStorage("initialDate")  var initialDate = 0
        @AppStorage("menstruationDuration")  var menstruationDuration = 1
        @AppStorage("cicleDuration")  var cicleDuration = 28
        print("aaaa")
        print(cicleDuration)
        self.cycleDuration = cicleDuration
        self.periodDuration = menstruationDuration
        self.accumulatedDegrees = accumulatedValue
        self.dateTrack = dateTrack
        self.degreesPerDay = Double(360 / cicleDuration)
        self.todayInCycle = initialDate
        self.accumulatedDegrees = degreesPerDay * Double(todayInCycle)
    }
    
    func getDate() -> String {
        let weekDay = dateTrack.todaysWeekday()
        let monthDay = dateTrack.todaysMonthDay()
        let month = dateTrack.todaysMonth()
        let weekdays = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
        let weekDayName = weekdays[weekDay-1]
        return weekDayName + ", " + "\(monthDay)" + "/" + "\(month)"

        
    }
    
    
    
}
