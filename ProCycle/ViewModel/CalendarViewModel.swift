//
//  TestViewModel.swift
//  ProCycle
//
//  Created by sml on 25/05/23.
//

import EventKit
import SwiftUI

class CalendarViewModel: ObservableObject {
    
    var eventStore = EKEventStore()
    @Published var events: [EKEvent] = []
    @Published var calendar: EKCalendar?
    
    init() {
        requestAccessToCalendar()
        self.calendar = addCalendar()
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: .event) { success, error in
            print(success)
        }
    }
    
    func bestPossibleEKSource() -> EKSource? {
        let `default` = eventStore.defaultCalendarForNewEvents?.source
        let iCloud = eventStore.sources.first(where: { $0.title == "iCloud" }) // this is fragile, user can rename the source
        let local = eventStore.sources.first(where: { $0.sourceType == .local })
        return `default` ?? iCloud ?? local
    }
    
    func addCalendar() -> EKCalendar {
        let calendars = eventStore.calendars(for: .event)
        let cicleCalendar = calendars.filter { calendar in
            return calendar.title == "Cicle"
        }
        if cicleCalendar.count != 0 {
            return cicleCalendar[0]
        } else {
            return newCalendar()
        }
    }
    
    func newCalendar() -> EKCalendar {
        let calendar = EKCalendar(for: .event, eventStore: self.eventStore)
        calendar.title = "Cicle"
        guard let source = self.bestPossibleEKSource() else {
            return EKCalendar()
        }
        calendar.source = source
        try! self.eventStore.saveCalendar(calendar, commit: true)
        return calendar
    }
    
    func calculateFutureEvents(menstruationDate: Date) {
        let monthsBefore = Date(timeIntervalSinceNow: 100*24*3600)
        let events = getEventsByDate(firstDate: monthsBefore, finalDate: menstruationDate)
        
        return
    }
    
    func adjustEventsInCalendarBy(menstruationDate: Date) {
        removeElementsInCalendarBy(menstruationDate: menstruationDate)
    }
    
    func removeElementsInCalendarBy(menstruationDate: Date) {
        let monthsAfter = Date(timeIntervalSinceNow: 100*24*3600)
        events = getEventsByDate(firstDate: menstruationDate, finalDate: monthsAfter)
        for event in events {
            removeEvent(eventId: event.calendarItemIdentifier)
        }
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> [EKEvent] {
        if let calendar = self.calendar {
            let monthsAfter = Date(timeIntervalSinceNow: 100*24*3600)
            
            let predicate =  eventStore.predicateForEvents(withStart: firstDate, end: finalDate, calendars: [calendar])
            let events = eventStore.events(matching: predicate)
            
            return events
        }
        return []
    }
    
    func removeEvent(eventId: String) {
        if let eventToDelete = self.eventStore.event(withIdentifier: eventId){
            do {
                try eventStore.remove(eventToDelete, span: .thisEvent)
            } catch let error as NSError {
                print("failed to save event with error : \(error)")
            }
            print("removed Event")
        }
    }
}
