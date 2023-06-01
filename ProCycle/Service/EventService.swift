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
            let predicate =  eventStore.predicateForEvents(withStart: firstDate, end: finalDate, calendars: [calendar])
            let events = eventStore.events(matching: predicate)
            
            return events
        }
        return []
    }
    
    
    func removeElementsInCalendarBy(menstruationDate: Date, calendar: EKCalendar) {
        let monthsAfter = Date().daysAfter(200)
        let events = getEventsByDate(firstDate: menstruationDate, finalDate: monthsAfter, calendar: calendar)
        for event in events {
            removeEvent(eventId: event.calendarItemIdentifier)
        }
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date, calendar: EKCalendar) {
        DispatchQueue.main.async {
            let newEvent = EKEvent(eventStore: self.eventStore)
            newEvent.title = title
            newEvent.startDate = startDate
            newEvent.endDate = endDate
            newEvent.calendar = calendar
            newEvent.isAllDay = true
            do {
                try self.eventStore.save(newEvent, span: .thisEvent)
              } catch let error as NSError {
                  print("failed to save event with error : \(error)")
              }
            
        }
    }
    
    func makeDictionaryOfEvents(events: [EKEvent]) -> [String: EKEvent] {
        var eventsAux = [String: EKEvent]()
        for event in events {
            let eventDays = event.startDate.daysBetween(event.endDate)
            for day in 0...eventDays {
                let modifiedDate = event.startDate.daysAfter(day)
                eventsAux[modifiedDate.formatted(date: .complete, time: .omitted)] = event
            }
        }
        return eventsAux
    }
    
    func eventsBefore(daysBefore: Int, finalDate: Date, calendar: EKCalendar) -> [EKEvent] {
        let daysBeforeDate = finalDate.daysBefore(daysBefore)
        return getEventsByDate(firstDate: daysBeforeDate, finalDate: finalDate, calendar: calendar)
    }
    
    func eventsAfter(daysAfter: Int, startDate: Date, calendar: EKCalendar) -> [EKEvent] {
        let daysAfterDate = startDate.daysAfter(daysAfter)
        return getEventsByDate(firstDate: startDate, finalDate: daysAfterDate, calendar: calendar)
    }
}
