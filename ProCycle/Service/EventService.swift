//
//  Event.swift
//  ProCycle
//
//  Created by sml on 26/05/23.
//

import EventKit
import SwiftUI

struct EventService{
    let eventStore: EKEventStore

    init(eventStore: EKEventStore) {
        self.eventStore = eventStore
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
    
    func getEventsByDate(firstDate: Date, finalDate: Date, calendar: EKCalendar?) -> [EKEvent] {
        if let calendar = calendar {
            let monthsAfter = Date(timeIntervalSinceNow: 100*24*3600)
            
            let predicate =  eventStore.predicateForEvents(withStart: firstDate, end: finalDate, calendars: [calendar])
            let events = eventStore.events(matching: predicate)
            
            return events
        }
        return []
    }
    
    
    func removeElementsInCalendarBy(menstruationDate: Date, calendar: EKCalendar) {
        let monthsAfter = Date(timeIntervalSinceNow: 100*24*3600)
        let events = getEventsByDate(firstDate: menstruationDate, finalDate: monthsAfter, calendar: calendar)
        for event in events {
            removeEvent(eventId: event.calendarItemIdentifier)
        }
    }
}
