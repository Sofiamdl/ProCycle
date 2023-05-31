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
    var monthsFromMenstruation: Int = 0
    
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        self.firstDayMenstruation = firstDayMenstruation
        self.averageMenstruationDuration = averageMenstruationDuration
        self.averageCycleDuration = averageCycleDuration
        self.eventStore = eventStore
    }
    
    mutating func getPhases() -> [(String, Date, Date)]{
        var auxArray: [(String, Date, Date)] = []
        for _ in 1...12 {
            auxArray.append(contentsOf: [calculateMenstruationDate(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
            monthsFromMenstruation += 1
        }
        return auxArray
    }
    
    
    func calculateMenstruationDate() -> (String, Date, Date) {
        let firstFertileDay = Calendar.current.date(byAdding: .day, value: averageCycleDuration*monthsFromMenstruation, to: firstDayMenstruation)!
        let lastFertileDay = Calendar.current.date(byAdding: .day, value: averageMenstruationDuration+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        if monthsFromMenstruation == 0 {
            return ("🩸 Menstruação", firstFertileDay, lastFertileDay)
        } else {
            return ("Menstruação Prevista", firstFertileDay, lastFertileDay)
        }
    }
    
    func calculateFolicularDate() -> (String, Date, Date){
        let firstLutealDate = Calendar.current.date(byAdding: .day, value: averageMenstruationDuration + 1+(averageCycleDuration*monthsFromMenstruation) , to: firstDayMenstruation)!
        let lastLutealDate = Calendar.current.date(byAdding: .day, value: 10+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        return ("⚡️ Fase folicular", firstLutealDate, lastLutealDate)
    }
    
    func calculateFertileDate() -> (String, Date, Date) {
        let firstFertileDay = Calendar.current.date(byAdding: .day, value: 11+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        let lastFertileDay = Calendar.current.date(byAdding: .day, value: 17+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        return ("💓 Período fertil", firstFertileDay, lastFertileDay)
    }
    
    
    func calculateLutealDate() -> (String, Date, Date) {
        let firstLutealDate = Calendar.current.date(byAdding: .day, value: 17+1+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        let lastLutealDate = Calendar.current.date(byAdding: .day, value: averageCycleDuration - 7 - 1+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        return ("⬛️ Fase lútea", firstLutealDate, lastLutealDate)
    }
    
    
    func calculatePMSDate() -> (String, Date, Date) {
        let firstPMSDay = Calendar.current.date(byAdding: .day, value: averageCycleDuration - 7+(averageCycleDuration*monthsFromMenstruation), to: firstDayMenstruation)!
        let lastPMSDay = Calendar.current.date(byAdding: .day, value: averageCycleDuration+(averageCycleDuration*monthsFromMenstruation)-1, to: firstDayMenstruation)!
        return ("😡 TPM", firstPMSDay, lastPMSDay)
    }
}
