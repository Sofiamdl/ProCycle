//
//  MonthCycleSerice.swift
//  ProCycle
//
//  Created by jpbol on 30/05/2023.
//

import Foundation
import SwiftUI
import EventKit

struct MonthCycleService {
    let firstDayMenstruation: Date
    let averageMenstruationDuration: Int
    let averageCycleDuration: Int
    
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        self.firstDayMenstruation = firstDayMenstruation
        self.averageMenstruationDuration = averageMenstruationDuration
        self.averageCycleDuration = averageCycleDuration
        self.eventStore = eventStore
    }
    
    func getPhases() -> [(String, Date, Date)]{
        return [calculateMenstruationDate(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()]
    }
    
    func calculateMenstruationDate() -> (String, Date, Date) {
        let firstFertileDay = Calendar.current.date(byAdding: .day, value: 0, to: firstDayMenstruation)!
        let lastFertileDay = Calendar.current.date(byAdding: .day, value: averageMenstruationDuration, to: firstDayMenstruation)!
        return ("🩸 Menstruação", firstFertileDay, lastFertileDay)
    }
    
    func calculateFolicularDate() -> (String, Date, Date){
        let firstLutealDate = Calendar.current.date(byAdding: .day, value: averageMenstruationDuration + 1 , to: firstDayMenstruation)!
        let lastLutealDate = Calendar.current.date(byAdding: .day, value: 10, to: firstDayMenstruation)!
        return ("⚡️ Fase folicular", firstLutealDate, lastLutealDate)
    }
    
    func calculateFertileDate() -> (String, Date, Date) {
        let firstFertileDay = Calendar.current.date(byAdding: .day, value: 11, to: firstDayMenstruation)!
        let lastFertileDay = Calendar.current.date(byAdding: .day, value: 17, to: firstDayMenstruation)!
        return ("💓 Período fertil", firstFertileDay, lastFertileDay)
    }
    
    
    func calculateLutealDate() -> (String, Date, Date) {
        let firstLutealDate = Calendar.current.date(byAdding: .day, value: 17+1, to: firstDayMenstruation)!
        let lastLutealDate = Calendar.current.date(byAdding: .day, value: averageCycleDuration - 7 - 1, to: firstDayMenstruation)!
        return ("⬛️ Fase lútea", firstLutealDate, lastLutealDate)
    }
    
    
    func calculatePMSDate() -> (String, Date, Date) {
        let firstPMSDay = Calendar.current.date(byAdding: .day, value: averageCycleDuration - 7, to: firstDayMenstruation)!
        let lastPMSDay = Calendar.current.date(byAdding: .day, value: averageCycleDuration, to: firstDayMenstruation)!
        return ("😡 TPM", firstPMSDay, lastPMSDay)
    }
    
}
