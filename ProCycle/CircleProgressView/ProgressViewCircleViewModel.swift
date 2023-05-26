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
    
    init(cycleDuration: Int = 28, periodDuration: Int = 6, accumulatedValue: Double = 12.8, aux: Double = 12.8, todayInCycle: Int = 7, dateTrack: DateTrack = DateTrack()) {
        self.cycleDuration = cycleDuration
        self.periodDuration = periodDuration
        self.accumulatedDegrees = accumulatedValue
        self.dateTrack = dateTrack
        self.degreesPerDay = Double(360 / cycleDuration)
        self.todayInCycle = todayInCycle
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
