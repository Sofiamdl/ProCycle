//
//  CalculateCycle.swift
//  ProCycle
//
//  Created by sml on 31/05/23.
//

import EventKit
import SwiftUI

struct CalculateCycle {
    func getFirstCycleFromLastPeriod(events: [EKEvent]) -> Date {
        let cycleEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.rawValue || event.title == CyclePhase.expectedMenstruation.rawValue
        }
        
        return cycleEvents[cycleEvents.count-1].startDate
    }
    
    func calculateAverageCycleDuration(eventsBefore: [EKEvent], eventsAfter: [EKEvent]) -> Int {
        let cycleEvents = eventsBefore.filter { event in
            return event.title == CyclePhase.menstruation.rawValue
        }
        var auxCounter = 0
        if cycleEvents.count == 1 {
            let expectedCycleEvents = eventsAfter.filter { event in
                return event.title == CyclePhase.expectedMenstruation.rawValue
            }
            return cycleEvents[0].startDate.daysBetween(expectedCycleEvents[0].startDate)
        }
        for event in 0...(cycleEvents.count-2) {
            let days = cycleEvents[event].startDate.daysBetween(cycleEvents[event].startDate)
            auxCounter += days
        }
        return auxCounter/(eventsBefore.count-1)
    }
    
    func calculateAverageMenstruationDuration(events: [EKEvent]) -> Int{
        let cycleEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.rawValue
        }
        
        var auxCounter = 1
        for event in cycleEvents {
            auxCounter += event.startDate.daysBetween(event.endDate)
        }

        return auxCounter/cycleEvents.count
    }
    
}
