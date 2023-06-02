//
//  Calendar.swift
//  ProCycle
//
//  Created by sml on 26/05/23.
//

import EventKit
import SwiftUI

struct CalendarService{
    var calendar: EKCalendar?
    let eventStore: EKEventStore

    init(eventStore: EKEventStore) {
        self.eventStore = eventStore
        self.calendar = getCalendar()
    }

    func bestPossibleEKSource() -> EKSource? {
        let `default` = eventStore.defaultCalendarForNewEvents?.source
        let iCloud = eventStore.sources.first(where: { $0.title == "iCloud" }) 
        let local = eventStore.sources.first(where: { $0.sourceType == .local })
        return `default` ?? iCloud ?? local
    }
    
    func getCalendar() -> EKCalendar {
        let calendars = eventStore.calendars(for: .event)
        let cicleCalendar = calendars.filter { calendar in
            return calendar.title == "Luna"
        }
        
        if cicleCalendar.count != 0 {
            return cicleCalendar[0]
        }
        
        return newCalendar()
    }
    
    func newCalendar() -> EKCalendar {
        let calendar = EKCalendar(for: .event, eventStore: eventStore)
        calendar.title = "Luna"
        calendar.color = .purple
        guard let source = self.bestPossibleEKSource() else {
            return EKCalendar()
        }
        calendar.source = source
        try! eventStore.saveCalendar(calendar, commit: true)
        return calendar
    }
}
