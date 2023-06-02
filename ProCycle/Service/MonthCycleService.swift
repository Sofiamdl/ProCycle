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
    var lastDayMenstruation: Date? = nil
    
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {
        self.firstDayMenstruation = firstDayMenstruation
        self.averageMenstruationDuration = averageMenstruationDuration
        self.averageCycleDuration = averageCycleDuration
        self.lastDayMenstruation = lastDayMenstruation
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
        if monthsFromMenstruation == 0 {
            if lastDayMenstruation == nil {
                return calculatePhaseDate(phase: CyclePhase.menstruation, 0, averageMenstruationDuration-1)
            }
            return calculatePhaseDate(phase: CyclePhase.menstruation, firstDayMenstruation.daysBetween(lastDayMenstruation!), averageMenstruationDuration+1)
        }
        return calculatePhaseDate(phase: CyclePhase.expectedMenstruation, 0, averageMenstruationDuration-1)
    }
    
    private func calculateFolicularDate() -> (String, Date, Date){
        return calculatePhaseDate(phase: CyclePhase.folicular, averageMenstruationDuration, 9)
    }
    
    private func calculateFertileDate() -> (String, Date, Date) {
        return calculatePhaseDate(phase: CyclePhase.fertile, 10, 16)
    }
    
    private func calculateLutealDate() -> (String, Date, Date) {
        return calculatePhaseDate(phase: CyclePhase.luteal, 17, averageCycleDuration-8)
    }
    
    private func calculatePMSDate() -> (String, Date, Date) {
        return calculatePhaseDate(phase: CyclePhase.pms, averageCycleDuration-7, averageCycleDuration-1)
    }
    
    private func calculatePhaseDate(phase:CyclePhase, _ firstDayDistanceFromCycle: Int, _ lastDayDistanceFromCycle: Int) -> (String, Date, Date) {
        let firstDayValue = (averageCycleDuration*monthsFromMenstruation)+firstDayDistanceFromCycle
        let lastDayValue = (averageCycleDuration*monthsFromMenstruation)+lastDayDistanceFromCycle
        let firstDay = firstDayMenstruation.daysAfter(firstDayValue)
        let lastDay = firstDayMenstruation.daysAfter(lastDayValue)
        return (phase.rawValue, firstDay, lastDay)
    }
}
